#include "chp_sim.h"
#include "clifford_T.h"



using namespace std;
// Function to check if addition overflows
bool additionWillOverflow(int a, int b) {
    // Check for positive overflow
    if (a > 0 && b > 0 && a > INT_MAX - b) {
        return true;
    }
    // Check for negative overflow
    if (a < 0 && b < 0 && a < INT_MIN - b) {
        return true;
    }
    return false;  // No overflow
}

// Function to check if multiplication overflows
bool multiplicationWillOverflow(int a, int b) {
    // Handle special cases
    if (a == 0 || b == 0) {
        return false;  // Multiplication with 0 never overflows
    }

    // Check for overflow conditions
    if (a > 0 && b > 0 && a > INT_MAX / b) {
        return true;  // Positive numbers overflow
    }
    if (a < 0 && b < 0 && a < INT_MAX / b) {
        return true;  // Negative numbers overflow
    }
    if (a > 0 && b < 0 && b < INT_MIN / a) {
        return true;  // Positive and negative overflow
    }
    if (a < 0 && b > 0 && a < INT_MIN / b) {
        return true;  // Negative and positive overflow
    }

    return false;  // No overflow
}

// Helper function to trim leading and trailing spaces
std::string trim(const std::string& str) {
    auto start = str.begin();
    while (start != str.end() && std::isspace(*start)) {
        start++;
    }

    auto end = str.end();
    do {
        end--;
    } while (std::distance(start, end) > 0 && std::isspace(*end));

    return std::string(start, end + 1);
}

void Observable::prepare_CCX() {
}

void Observable::prepare_T() {

}

void Observable::parseObservableMap(const string& filename) {
    ifstream infile(filename);
    string line;
    int state = 0; // 0: None, 1: Clifford
    char circuit_type;
    for (int i = 0; i < _numOriginal; ++i) {
        _original_map.push_back(make_pair('I', -1));
    }
    for (int i = 0; i < _numCuts; ++i) {
        _input_map.push_back(make_pair('I', -1));
        _output_map.push_back(make_pair('I', -1));
    }

    int i_Clifford = 0;
    int i_circuit = 0;

    // Check if file opened successfully
    if (!infile) {
        cerr << "Unable to open file: " << filename << endl;
        return;
    }

    while (getline(infile, line)) {
        // Ignore the first line or any empty lines
        if (line.empty()) {
            continue;
        }
        if (line.find("Clifford measurements:") != string::npos) {
            state = 1;
            continue;
        }
        if (line.find("T gates settings:") != string::npos) {
            continue;
        }
        if (line.find("CCX gates settings:") != string::npos) {
            continue;
        }
        if (line.find("Tableau of main Clifford circuit:") != string::npos) {
            break;
        }

        // Split the line into the type (output/input/original) and the associated number
        istringstream iss(line);
        string word1, ignore;
        int num = -1;
        string gate_type = "";

        iss >> word1;  // Read the first word (output, input, original)

        // If there is a number, it follows the second word (e.g., "cut" or original number)
        if (word1 == "input") {
            iss >> ignore >> ignore >> num >> gate_type;  // Read "cut" and "of" and the associated number
            _input_map[num] = make_pair(gate_type=="ccx"?'X':'T', i_Clifford);
            _num_delayed_prepare++;
        } else if (word1 == "output") {
            iss >> ignore >> ignore >> num >> gate_type;  // Read "cut" and "of" and the associated number
            _output_map[num] = make_pair(gate_type=="ccx"?'X':'T', i_Clifford);
        } else if (word1 == "original") {
            iss >> num;  // Read the number after "original"
            //_original_map[num] = make_pair(circuit_type, i_Clifford);
        }

        if (state == 1) {
            _Clifford_map.push_back(make_pair(word1, num));
            i_Clifford++;
        }
    }

    infile.close();
    _clifford_simulator.read_tableau(filename);
    // cout << "Tableau read" << endl;
    // _clifford_simulator.printTable();
    // print_maps();
}

void Observable::parseCircuit(const std::string& filename) {
    std::ifstream file(filename);

    if (!file.is_open()) {
        throw std::runtime_error("Could not open file: " + filename);
    }

    std::string line;

    while (std::getline(file, line)) {
        std::istringstream iss(line);
        std::string gate;
        char ignore; // For characters like 'q', '[' and ']', and ','
        int qubit1, qubit2;

        iss >> gate;

        if (gate == "h") {  // Hadamard gate
            iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
            cout << "Applying Hadamard gate to qubit " << qubit1 << endl;
            _clifford_simulator.hadamard(qubit1);
        } else if (gate == "x") {  // X gate
            iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
            cout << "Applying X gate to qubit " << qubit1 << endl;
            _clifford_simulator.x(qubit1);
        } else if (gate == "y") {  // Y gate
            iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
            cout << "Applying Y gate to qubit " << qubit1 << endl;
            _clifford_simulator.y(qubit1);
        } else if (gate == "z") {  // Z gate
            iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
            cout << "Applying Z gate to qubit " << qubit1 << endl;
            _clifford_simulator.z(qubit1);
        } else if (gate == "cx") {  // CNOT gate
            iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1],'
            iss >> ignore >> ignore >> qubit2 >> ignore;  // Read 'q[qubit2];'
            cout << "Applying CNOT gate to qubits control: " << qubit1 << " and target: " << qubit2 << endl;
            _clifford_simulator.cnot(qubit1, qubit2);
        } else if (gate == "s") {  // Phase gate (S gate)
            iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
            cout << "Applying Phase gate to qubit " << qubit1 << endl;
            _clifford_simulator.phase(qubit1);
        } else {
            throw std::runtime_error("Unknown gate: " + gate);
        }
    }
    _clifford_simulator.record();
    // _clifford_simulator.printTable();
    file.close();
}

inline string Observable::toCliffordObservable(vector<char>& current_sequence) {
    string clifford_observable = "";
    for (int i = 0; i < _numQubits; ++i) {
        if (_Clifford_map[i].first == "original") {
            clifford_observable.push_back('I');
        }
        else if (_Clifford_map[i].first == "output") {
            clifford_observable.push_back(current_sequence[_Clifford_map[i].second * 2 + 1]);
        }
        else if (_Clifford_map[i].first == "input") {
            if (current_sequence[_Clifford_map[i].second * 2] == '0') {
                clifford_observable.push_back('1');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == '1') {
                clifford_observable.push_back('0');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == '+') {
                clifford_observable.push_back('-');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == '-') {
                clifford_observable.push_back('+');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == 'i') {
                clifford_observable.push_back('j');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == 'j') {
                clifford_observable.push_back('i');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == 'I') {
                clifford_observable.push_back('I');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == 'X') {
                clifford_observable.push_back('X');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == 'Y') {
                clifford_observable.push_back('Y');
            }
            else if (current_sequence[_Clifford_map[i].second * 2] == 'Z') {
                clifford_observable.push_back('Z');
            }
            else {
                throw std::runtime_error("Invalid Clifford delayed prepare setting");
            }
        }
        else {
            std::cout << _Clifford_map[i].first << std::endl;
            throw std::runtime_error("Invalid Clifford setting");
        }
    }
    return clifford_observable;
}

vector<int> Observable::get_output_prob(string& q){
    vector<int> output_prob(3, 0);
    vector<char> current_sequence;
    // do the original measurements
    string clifford_observable = "";
    for (int i = 0; i < _numQubits; ++i) {
        if (_Clifford_map[i].first == "original" && q.size() > _Clifford_map[i].second) {
            if (q[_Clifford_map[i].second] == 'X' || q[_Clifford_map[i].second] == 'Y' || q[_Clifford_map[i].second] == 'Z') {
                clifford_observable.push_back('I');
            } else {
                clifford_observable.push_back(q[_Clifford_map[i].second]);
            }

        } else {
            clifford_observable.push_back('I');
        }
    }
    // cout << "CLIFFORD_observable: " << clifford_observable << endl;
    _clifford_simulator.measure(clifford_observable);
    // cout << "CLIFFORD_observable measured" << endl;
    // _clifford_simulator.printTable();
    // get_prob should be called before record since record will reset the probability
    pair<int, int> prob_clifford = _clifford_simulator.get_prob();
    _clifford_simulator.record_no_delayed_prepare();
    vector<int> prob_clifford_vec(3);
    prob_clifford_vec[0] = prob_clifford.first;
    prob_clifford_vec[1] = 0;
    prob_clifford_vec[2] = prob_clifford.second;
    // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;

    if (_use_grouping) _iterate_group_measurement(current_sequence, output_prob, vector<int>({1,0,0}));
    else _iterate_measurement(current_sequence, output_prob, vector<int>({1,0,0}));
    // cout << "output_prob: " << output_prob[0] << " " << output_prob[1] << " " << output_prob[2] << endl;
    vector<int> prob = _multiply_prob(prob_clifford_vec, output_prob);
    _clifford_simulator.restore();
    return prob;

}

vector<int> Observable::get_output_prob(vector<bool>& q){
    vector<int> output_prob(3, 0);
    vector<char> current_sequence;
    // do the original measurements
    string clifford_observable = "";
    for (int i = 0; i < _numQubits; ++i) {
        if (_Clifford_map[i].first == "original" && q.size() > _Clifford_map[i].second) {
            clifford_observable.push_back(q[_Clifford_map[i].second]? '1' : '0');

        } else {
            clifford_observable.push_back('I');
        }
    }
    // cout << "CLIFFORD_observable: " << clifford_observable << endl;
    _clifford_simulator.measure(clifford_observable);
    // get_prob should be called before record since record will reset the probability
    pair<int, int> prob_clifford = _clifford_simulator.get_prob();
    _clifford_simulator.record_no_delayed_prepare();
    vector<int> prob_clifford_vec(3);
    prob_clifford_vec[0] = prob_clifford.first;
    prob_clifford_vec[1] = 0;
    prob_clifford_vec[2] = prob_clifford.second;
    // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;

    if (_use_grouping) _iterate_group_measurement(current_sequence, output_prob, vector<int>({1,0,0}));
    else _iterate_measurement(current_sequence, output_prob, vector<int>({1,0,0}));
    // cout << "output_prob: " << output_prob[0] << " " << output_prob[1] << " " << output_prob[2] << endl;

    vector<int> prob = _multiply_prob(prob_clifford_vec, output_prob);
    _clifford_simulator.restore();
    return prob;
}

void Observable::_iterate_measurement(vector<char>& current_sequence, vector<int>& total_prob, vector<int> coeff) { // current_sequence: 0I1I0X1X0Y1Y0Z1Z (prepare, measure, prepare, measure, ...)
    if (current_sequence.size() == _input_map.size() * 2) {
        _num_obs++;

        // Clifford part
        string clifford_observable = "";
        for (int i = 0; i < _numQubits; ++i) {
            if (_Clifford_map[i].first == "original") {
                clifford_observable.push_back('I');
            }
            else if (_Clifford_map[i].first == "output") {
                clifford_observable.push_back(current_sequence[_Clifford_map[i].second * 2 + 1]);
            }
            else if (_Clifford_map[i].first == "input") {
                if (current_sequence[_Clifford_map[i].second * 2] == '0') {
                    clifford_observable.push_back('1');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == '1') {
                    clifford_observable.push_back('0');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == '+') {
                    clifford_observable.push_back('-');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == '-') {
                    clifford_observable.push_back('+');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == 'i') {
                    clifford_observable.push_back('j');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == 'j') {
                    clifford_observable.push_back('i');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == 'I') {
                    clifford_observable.push_back('I');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == 'X') {
                    clifford_observable.push_back('X');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == 'Y') {
                    clifford_observable.push_back('Y');
                }
                else if (current_sequence[_Clifford_map[i].second * 2] == 'Z') {
                    clifford_observable.push_back('Z');
                }
                else {
                    throw std::runtime_error("Invalid Clifford delayed prepare setting");
                }
            }
            else {
                std::cout << _Clifford_map[i].first << std::endl;
                throw std::runtime_error("Invalid Clifford setting");
            }
        }
        _clifford_simulator.measure(clifford_observable);
        pair<int, int> prob_clifford = _clifford_simulator.get_prob();
        vector<int> prob_clifford_vec(3);
        prob_clifford_vec[0] = prob_clifford.first;
        prob_clifford_vec[1] = 0;
        prob_clifford_vec[2] = prob_clifford.second;

        vector<int> prob = _multiply_prob(coeff, prob_clifford_vec);
        prob[0] = (1<<_num_delayed_prepare) * prob[0];
        prob[1] = (1<<_num_delayed_prepare) * prob[1];
        total_prob = _sum_prob(total_prob, prob);

        // check value for each configuration
        // if (prob_clifford_vec[0] != 0 || prob_clifford_vec[1] != 0)
        // {
        //     for(char c : current_sequence) cout << c;
        //     cout << " : ";
        //     cout << prob_clifford_vec[0] << ' ' << prob_clifford_vec[1] << ' ' << prob_clifford_vec[2] << '\t';
        //     cout << coeff[0] << ' ' << coeff[1] << ' ' << coeff[2] << endl;
        // }

        _clifford_simulator.restore_no_delayed_prepare();
    }
    else {
        if (_input_map[current_sequence.size() / 2].first == 'X') {
            for (int i = 0; i < _measure_sequence_CCX[0].size(); ++i) {
                current_sequence.push_back(_prepare_sequence_CCX[0][i]);
                current_sequence.push_back(_measure_sequence_CCX[0][i]);
                current_sequence.push_back(_prepare_sequence_CCX[1][i]);
                current_sequence.push_back(_measure_sequence_CCX[1][i]);
                current_sequence.push_back(_prepare_sequence_CCX[2][i]);
                current_sequence.push_back(_measure_sequence_CCX[2][i]);

                _iterate_measurement(current_sequence, total_prob, _multiply_prob(coeff, _coef_sequence_CCX[i]));

                current_sequence.pop_back();
                current_sequence.pop_back();
                current_sequence.pop_back();
                current_sequence.pop_back();
                current_sequence.pop_back();
                current_sequence.pop_back();
            }
        }
        else if (_input_map[current_sequence.size() / 2].first == 'T') {
            for (int i = 0; i < _measure_sequence_T.size(); ++i) {
                current_sequence.push_back(_prepare_sequence_T[i]);
                current_sequence.push_back(_measure_sequence_T[i]);

                _iterate_measurement(current_sequence, total_prob, _multiply_prob(coeff, _coef_sequence_T[i]));

                current_sequence.pop_back();
                current_sequence.pop_back();
            }
        }
        else {
            std::cout << _input_map[current_sequence.size()].first << std::endl;
        }
    }

}

void Observable::_iterate_group_measurement(vector<char>& current_sequence, vector<int>& total_prob, vector<int> coeff) {
    // Assume the non-Clifford part is only T gates or one Toffoli gate
    if (_input_map[0].first == 'T') {
        int num_T = _input_map.size();
        // Use the systematic partition, let A = {ZZ,XX,YY}, B = {II,XY,YX}
        // For n T gates, there are 6^n Pauli strings
        // Traverse all length-n bit strings, each bit string corresponds to a grouping
        // For example, assume n = 3, '010' corresponds to ABA
        // In this way, 6^n Pauli strings will be partitioned into 2^n groups with 3^n elements in each group

        // TODO : implement grouping for T gates
        // This is actually of low priority, since we only use random circuits for T gates
        // , which has poor performance for grouping technique
        vector<vector<int>> partition_T = {{1, 2, 4},
                                           {0, 3, 5}};
        // iterate all bit strings
        for(int i=0;i<pow(2, num_T);i++) {
            // bit representation of i
            cout << "i = " << i << endl;
            int tmp_i = i;
            vector<int> bstr(num_T, 0);
            for(int j=0;j<num_T;j++) {
                bstr[j] = tmp_i%2;
                tmp_i /= 2;
            }
            // iterate all elements
            for(int j=0;j<pow(3, num_T);j++) {
                // Decide current_sequence
                // represent j in base 3
                int tmp_j = j;
                vector<int> b3str(num_T, 0);
                for(int k=0;k<num_T;k++) {
                    b3str[k] = tmp_j%3;
                    tmp_j /= 3;
                }
                current_sequence.clear();
                coeff = vector<int>({1,0,0});
                for(int k=0;k<num_T;k++) {
                    int target = partition_T[bstr[k]][b3str[k]];
                    current_sequence.push_back(_prepare_sequence_T[target]);
                    current_sequence.push_back(_measure_sequence_T[target]);
                    coeff = _multiply_prob(coeff, _coef_sequence_T[target]);
                }
                // Measurement
                _num_obs++;

                // Clifford part
                string clifford_observable = "";
                for (int i = 0; i < _numQubits; ++i) {
                    if (_Clifford_map[i].first == "original") {
                        clifford_observable.push_back('I');
                    }
                    else if (_Clifford_map[i].first == "output") {
                        clifford_observable.push_back(current_sequence[_Clifford_map[i].second * 2 + 1]);
                    }
                    else if (_Clifford_map[i].first == "input") {
                        if (current_sequence[_Clifford_map[i].second * 2] == '0') {
                            clifford_observable.push_back('1');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == '1') {
                            clifford_observable.push_back('0');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == '+') {
                            clifford_observable.push_back('-');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == '-') {
                            clifford_observable.push_back('+');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == 'i') {
                            clifford_observable.push_back('j');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == 'j') {
                            clifford_observable.push_back('i');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == 'I') {
                            clifford_observable.push_back('I');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == 'X') {
                            clifford_observable.push_back('X');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == 'Y') {
                            clifford_observable.push_back('Y');
                        }
                        else if (current_sequence[_Clifford_map[i].second * 2] == 'Z') {
                            clifford_observable.push_back('Z');
                        }
                        else {
                            throw std::runtime_error("Invalid Clifford delayed prepare setting");
                        }
                    }
                    else {
                        std::cout << _Clifford_map[i].first << std::endl;
                        throw std::runtime_error("Invalid Clifford setting");
                    }
                }
                _clifford_simulator.measure(clifford_observable);
                pair<int, int> prob_clifford = _clifford_simulator.get_prob();
                vector<int> prob_clifford_vec(3);
                prob_clifford_vec[0] = prob_clifford.first;
                prob_clifford_vec[1] = 0;
                prob_clifford_vec[2] = prob_clifford.second;

                vector<int> prob = _multiply_prob(coeff, prob_clifford_vec);
                prob[0] = (1<<_num_delayed_prepare) * prob[0];
                prob[1] = (1<<_num_delayed_prepare) * prob[1];
                total_prob = _sum_prob(total_prob, prob);

                // check value for each configuration
                if (prob_clifford_vec[0] != 0 || prob_clifford_vec[1] != 0) {
                    for(char c : current_sequence) cout << c;
                    cout << " : ";
                    cout << prob_clifford_vec[0] << ' ' << prob_clifford_vec[1] << ' ' << prob_clifford_vec[2] << '\t';
                    cout << coeff[0] << ' ' << coeff[1] << ' ' << coeff[2] << endl;
                }

                _clifford_simulator.restore_no_delayed_prepare();
            }
        }
    }
    else if (_input_map[0].first == 'X') {
        if (_input_map.size() / 3 != 1) cout << "Currently >1 Toffoli gates not supported." << endl;
        else {
            // We briefly explain how we do grouping for single CCZ gates
            // There are 8 groups
            // First is for Pauli strings that maps to itself, i.e. Pauli strings composed of I and Z
            // The remaining 7 groups has similar structure
            // One of the group is {I,Z}X{I,Z}{I,Z}X{I,Z} U {I,Z}Y{I,Z}{I,Z}Y{I,Z}
            // Other 6 groups can be similarly derived by changing the non-IZ positions
            unordered_map<string, int> coef_map;
            for (int i = 0; i < _measure_sequence_CCX[0].size(); i++) {
                string conf = "";
                for (int j = 0; j < _measure_sequence_CCX.size(); j++) {
                    conf += _prepare_sequence_CCX[j][i];
                    conf += _measure_sequence_CCX[j][i];
                }
                coef_map[conf] = i;
            }

            int num_group = 8;
            vector<vector<string>> CCX_grouping = {
                {"III","ZII","IZI","IIX","ZZI","ZIX","IZX","ZZX"},
                {"XII","XZI","XIX","XZX","YII","YZI","YIX","YZX"},
                {"IXI","ZXI","IXX","ZXX","IYI","ZYI","IYX","ZYX"},
                {"IIZ","ZIZ","IZZ","ZZZ","IIY","ZIY","IZY","ZZY"},
                {"XXI","XXX","YYI","YYX","XYI","XYX","YXI","YXX"},
                {"XIZ","XZZ","YIY","YZY","XIY","XZY","YIZ","YZZ"},
                {"IXZ","ZXZ","IYY","ZYY","IXY","ZXY","IYZ","ZYZ"},
                {"XXZ","YYZ","YXY","XYY","YXZ","XYZ","XXY","YYY"}
            };
            vector<vector<int>> half_generator = {
                {},
                {1,4,5,7},
                {2,4,6,7},
                {3,5,6,7},
                {1,2,5,6},
                {1,3,4,6},
                {2,3,4,5},
                {1,2,3,7}
            };
            // No grouping method
            /*
            for(int i = 0;i<num_group;i++) {
                // iterate all groups
                // cout << "i = " << i << endl;
                int iter_size = CCX_grouping[i].size() * ((i==0)? 1 : 4);
                for(int j=0;j<iter_size;j++) {
                    // decide current sequence
                    current_sequence.clear();
                    coeff = vector<int>({1,0,0});
                    if (i == 0) {
                        // one to one
                        string seq = "";
                        for(int k=0;k<_measure_sequence_CCX.size();k++) {
                            seq += CCX_grouping[i][j][k];
                            seq += CCX_grouping[i][j][k];
                        }
                        current_sequence = vector<char>(seq.begin(), seq.end());
                        coeff = _coef_sequence_CCX[coef_map[seq]];
                    }
                    else {
                        // one to four
                        string seq = "";
                        for(int k=0;k<_measure_sequence_CCX.size();k++) {
                            int target_j = j / 4;
                            int target_j2 = ((j >= (CCX_grouping[i].size() * 2))? 4 : 0) + j % 4;
                            seq += CCX_grouping[i][target_j][k];
                            seq += CCX_grouping[i][target_j2][k];
                        }
                        current_sequence = vector<char>(seq.begin(), seq.end());
                        coeff = _coef_sequence_CCX[coef_map[seq]];
                    }
                    // Measurement
                    _num_obs++;

                    // Clifford part
                    string clifford_observable = "";
                    for (int i = 0; i < _numQubits; ++i) {
                        if (_Clifford_map[i].first == "original") {
                            clifford_observable.push_back('I');
                        }
                        else if (_Clifford_map[i].first == "output") {
                            clifford_observable.push_back(current_sequence[_Clifford_map[i].second * 2 + 1]);
                        }
                        else if (_Clifford_map[i].first == "input") {
                            if (current_sequence[_Clifford_map[i].second * 2] == '0') {
                                clifford_observable.push_back('1');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == '1') {
                                clifford_observable.push_back('0');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == '+') {
                                clifford_observable.push_back('-');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == '-') {
                                clifford_observable.push_back('+');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == 'i') {
                                clifford_observable.push_back('j');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == 'j') {
                                clifford_observable.push_back('i');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == 'I') {
                                clifford_observable.push_back('I');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == 'X') {
                                clifford_observable.push_back('X');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == 'Y') {
                                clifford_observable.push_back('Y');
                            }
                            else if (current_sequence[_Clifford_map[i].second * 2] == 'Z') {
                                clifford_observable.push_back('Z');
                            }
                            else {
                                throw std::runtime_error("Invalid Clifford delayed prepare setting");
                            }
                        }
                        else {
                            std::cout << _Clifford_map[i].first << std::endl;
                            throw std::runtime_error("Invalid Clifford setting");
                        }
                    }
                    _clifford_simulator.measure(clifford_observable);
                    pair<int, int> prob_clifford = _clifford_simulator.get_prob();
                    vector<int> prob_clifford_vec(3);
                    prob_clifford_vec[0] = prob_clifford.first;
                    prob_clifford_vec[1] = 0;
                    prob_clifford_vec[2] = prob_clifford.second;

                    vector<int> prob = _multiply_prob(coeff, prob_clifford_vec);
                    prob[0] = (1<<_num_delayed_prepare) * prob[0];
                    prob[1] = (1<<_num_delayed_prepare) * prob[1];
                    total_prob = _sum_prob(total_prob, prob);

                    // check value for each configuration
                    // if (prob_clifford_vec[0] != 0 || prob_clifford_vec[1] != 0) {
                    //     for(char c : current_sequence) cout << c;
                    //     cout << " : ";
                    //     cout << prob_clifford_vec[0] << ' ' << prob_clifford_vec[1] << ' ' << prob_clifford_vec[2] << '\t';
                    //     cout << coeff[0] << ' ' << coeff[1] << ' ' << coeff[2] << endl;
                    // }

                    _clifford_simulator.restore_no_delayed_prepare();
                }
            }
            */

            // Grouping method
            // Measure the first group then record
            // Because the observables are Pauli strings, only 1, 0, -1 will occur
            vector<int> first_group_value(CCX_grouping[0].size());
            for(int j=0;j<CCX_grouping[0].size();j++) {
                // decide current sequence
                current_sequence.clear();
                coeff = vector<int>({1,0,0});
                // one to one
                string seq = "";
                for(int k=0;k<_measure_sequence_CCX.size();k++) {
                    seq += CCX_grouping[0][j][k];
                    seq += CCX_grouping[0][j][k];
                }
                current_sequence = vector<char>(seq.begin(), seq.end());
                coeff = _coef_sequence_CCX[coef_map[seq]];

                // Measurement
                _num_obs++;

                _clifford_simulator.measure(toCliffordObservable(current_sequence));
                pair<int, int> prob_clifford = _clifford_simulator.get_prob();
                vector<int> prob_clifford_vec(3);
                prob_clifford_vec[0] = prob_clifford.first;
                prob_clifford_vec[1] = 0;
                prob_clifford_vec[2] = prob_clifford.second;

                first_group_value[j] = prob_clifford.first;

                vector<int> prob = _multiply_prob(coeff, prob_clifford_vec);
                prob[0] = (1<<_num_delayed_prepare) * prob[0];
                prob[1] = (1<<_num_delayed_prepare) * prob[1];
                total_prob = _sum_prob(total_prob, prob);

                _clifford_simulator.restore_no_delayed_prepare();
            }

            // The other 7 groups
            // Here, we use the grouping technique to eliminate calculations
            for(int i = 1;i<num_group;i++) {
                // this is the easier implementation of observable grouping
                // if the half generator has value 1, the first half and the second half will cancel out
                // if the half generator has value -1, the first half and the second half will be the same
                // otherwise, no grouping will occurred
                int state = 0;
                for(int g : half_generator[i]) {
                    if (first_group_value[g] == 1) {
                        state = 1;
                        break;
                    }
                    else if (first_group_value[g] == -1) {
                        state = 2;
                        break;
                    }
                }
                // cout << "i = " << i << ", state = " << state << endl;
                if (state == 1) continue;
                for(int j=0;j < pow(2, CCX_grouping[i].size() / 2);j++) {
                    // decide current sequence
                    current_sequence.clear();
                    coeff = vector<int>({1,0,0});

                    // one to four
                    string seq = "";
                    for(int k=0;k<_measure_sequence_CCX.size();k++) {
                        int target_j = j / 4;
                        int target_j2 = j % 4;
                        seq += CCX_grouping[i][target_j][k];
                        seq += CCX_grouping[i][target_j2][k];
                    }
                    current_sequence = vector<char>(seq.begin(), seq.end());
                    coeff = _coef_sequence_CCX[coef_map[seq]];

                    // Measurement
                    _num_obs++;

                    _clifford_simulator.measure(toCliffordObservable(current_sequence));
                    pair<int, int> prob_clifford = _clifford_simulator.get_prob();
                    vector<int> prob_clifford_vec(3);
                    prob_clifford_vec[0] = prob_clifford.first;
                    prob_clifford_vec[1] = 0;
                    prob_clifford_vec[2] = prob_clifford.second;
                    if (state == 2) {
                        prob_clifford_vec[0] *= 2;
                        _num_obs++;
                    }
                    vector<int> prob = _multiply_prob(coeff, prob_clifford_vec);
                    prob[0] = (1<<_num_delayed_prepare) * prob[0];
                    prob[1] = (1<<_num_delayed_prepare) * prob[1];
                    total_prob = _sum_prob(total_prob, prob);

                    // check value for each configuration
                    // if (prob_clifford_vec[0] != 0 || prob_clifford_vec[1] != 0) {
                    //     for(char c : current_sequence) cout << c;
                    //     cout << " : ";
                    //     cout << prob_clifford_vec[0] << ' ' << prob_clifford_vec[1] << ' ' << prob_clifford_vec[2] << '\t';
                    //     cout << coeff[0] << ' ' << coeff[1] << ' ' << coeff[2] << endl;
                    // }

                    _clifford_simulator.restore_no_delayed_prepare();
                    if (state == 0 && prob_clifford.first == 0) {
                        // decide current sequence
                        current_sequence.clear();
                        coeff = vector<int>({1,0,0});

                        // one to four
                        string seq = "";
                        for(int k=0;k<_measure_sequence_CCX.size();k++) {
                            int target_j = j / 4 + 4;
                            int target_j2 = j % 4 + 4;
                            seq += CCX_grouping[i][target_j][k];
                            seq += CCX_grouping[i][target_j2][k];
                        }
                        current_sequence = vector<char>(seq.begin(), seq.end());
                        coeff = _coef_sequence_CCX[coef_map[seq]];

                        // Measurement
                        _num_obs++;

                        _clifford_simulator.measure(toCliffordObservable(current_sequence));
                        pair<int, int> prob_clifford = _clifford_simulator.get_prob();
                        vector<int> prob_clifford_vec(3);
                        prob_clifford_vec[0] = prob_clifford.first;
                        prob_clifford_vec[1] = 0;
                        prob_clifford_vec[2] = prob_clifford.second;

                        vector<int> prob = _multiply_prob(coeff, prob_clifford_vec);
                        prob[0] = (1<<_num_delayed_prepare) * prob[0];
                        prob[1] = (1<<_num_delayed_prepare) * prob[1];
                        total_prob = _sum_prob(total_prob, prob);

                        _clifford_simulator.restore_no_delayed_prepare();
                    }
                }
            }
        }
    }
    else {
        cout << _input_map[0].first << " is not supported." << endl;
    }
}

vector<int> Observable::_multiply_prob(const vector<int>& prob1, const vector<int>& prob2) {
    vector<int> prob(3);
    prob[0] = prob1[0] * prob2[0] + (2 * prob1[1] * prob2[1]);
    prob[1] = prob1[0] * prob2[1] + prob1[1] * prob2[0];
    prob[2] = prob1[2] + prob2[2];
    while (prob[0] % 2 == 0 && prob[1] % 2 == 0 && prob[2] > 0) {
        prob[0] /= 2;
        prob[1] /= 2;
        prob[2]--;
    }
    return prob;
}

vector<int> Observable::_sum_prob(const vector<int>& prob1, const vector<int>& prob2) {
    vector<int> prob(3);
    if (prob1[2] > prob2[2]) {
        prob[0] = prob1[0] + ((1<<(prob1[2]-prob2[2])) * prob2[0]);
        prob[1] = prob1[1] + ((1<<(prob1[2]-prob2[2])) * prob2[1]);
        prob[2] = prob1[2];
    }
    else {
        prob[0] = prob2[0] + ((1<<(prob2[2]-prob1[2])) * prob1[0]);
        prob[1] = prob2[1] + ((1<<(prob2[2]-prob1[2])) * prob1[1]);
        prob[2] = prob2[2];
    }
    while (prob[0] % 2 == 0 && prob[1] % 2 == 0 && prob[2] > 0) {
        prob[0] /= 2;
        prob[1] /= 2;
        prob[2]--;
    }
    return prob;
}

void Observable::print_maps(){
    std::cout << "Clifford map:" << endl;
    for (const auto& p : _Clifford_map) {
        std::cout << "{" << p.first << ", " << p.second << "}" << endl;
    }
    std::cout << "T map:" << endl;
    for (const auto& p : _T_map) {
        std::cout << "{" << p.first << ", " << p.second << "}" << endl;
    }
    std::cout << "CCX map:" << endl;
    for (const auto& p : _CCX_map) {
        std::cout << "{" << p.first << ", " << p.second << "}" << endl;
    }
    std::cout << "Original map:" << endl;
    for (const auto& p : _original_map) {
        std::cout << "{" << p.first << ", " << p.second << "}" << endl;
    }
}
