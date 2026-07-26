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

void Observable::load_CXX(const std::string& filename) {
    std::ifstream file(filename);
    std::string line;

    // Check if the file was opened successfully
    if (!file.is_open()) {
        std::cerr << "Error: Could not open file " << filename << std::endl;
    }

    // Read the CSV line by line
    while (std::getline(file, line)) {
        std::stringstream ss(line);
        std::string input0, input1, input2;
        std::string measure0, measure1, measure2;
        std::string ignore0, ignore1, ignore2;
        std::string prob_str;

        // Parse the CSV line into variables
        std::getline(ss, input0, ',');
        input0 = trim(input0);
        std::getline(ss, input1, ',');
        input1 = trim(input1);
        std::getline(ss, input2, ',');
        input2 = trim(input2);
        std::getline(ss, measure0, ',');
        measure0 = trim(measure0);
        std::getline(ss, measure1, ',');
        measure1 = trim(measure1);
        std::getline(ss, measure2, ',');
        measure2 = trim(measure2);
        std::getline(ss, ignore0, ',');
        std::getline(ss, ignore1, ',');
        std::getline(ss, ignore2, ',');
        std::getline(ss, prob_str, ',');
        prob_str = trim(prob_str);

        vector<int> prob(3, 0);
        if (prob_str == "1.0") {
            prob[0] = 1;
            prob[2] = 0;
        } else if (prob_str == "0.0") {
            prob[0] = 0;
            prob[2] = 0;
        } else if (prob_str == "0.5") {
            prob[0] = 1;
            prob[2] = 1;
        } else if (prob_str == "0.25") {
            prob[0] = 1;
            prob[2] = 2;
        } else if (prob_str == "0.125") {
            prob[0] = 1;
            prob[2] = 3;
        } else if (prob_str == "-1.0") {
            prob[0] = -1;
            prob[2] = 0;
        } else if (prob_str == "-0.5") {
            prob[0] = -1;
            prob[2] = 1;
        } else if (prob_str == "-0.25") {
            prob[0] = -1;
            prob[2] = 2;
        } else if (prob_str == "0.75") {
            prob[0] = 1;
            prob[2] = 3;
        } else if (prob_str == "0.625") {
            prob[0] = 5;
            prob[2] = 3;
        } else if (prob_str == "0.375") {
            prob[0] = 3;
            prob[2] = 3;
        } else if (prob_str == "-0.125") {
            prob[0] = -1;
            prob[2] = 3;
        } else if (prob_str == "0.5") {
            prob[0] = 1;
            prob[2] = 1;
        } else if (prob_str == "0.5625") {
            prob[0] = 9;
            prob[2] = 4;
        } else if (prob_str == "0.0625") {
            prob[0] = 1;
            prob[2] = 4;
        } else if (prob_str == "0.3125") {
            prob[0] = 5;
            prob[2] = 4;
        } else {
            std::cerr << "Error: Unknown probability value " << prob_str << std::endl;
        }
        
        // Create the key using input0, measure0, input1, measure1, input2, measure2
        std::string key = input0 + measure0 + input1 + measure1 + input2 + measure2;

        // Add the key-value pair to the unordered_map
        _CCX_table.insert(make_pair(key, prob));
    }

    // Close the file
    file.close();
}

void Observable::prepare_T() {
    vector<int> prob(3, 0);
    //0.0: 01, 0X, 0Y, 10, 1X, 1Y, +Z, -Z, iZ, jZ
    _T_table.insert(make_pair("01", prob));
    _T_table.insert(make_pair("0X", prob));
    _T_table.insert(make_pair("0Y", prob));
    _T_table.insert(make_pair("10", prob));
    _T_table.insert(make_pair("1X", prob));
    _T_table.insert(make_pair("1Y", prob));
    _T_table.insert(make_pair("+Z", prob));
    _T_table.insert(make_pair("-Z", prob));
    _T_table.insert(make_pair("iZ", prob));
    _T_table.insert(make_pair("jZ", prob));
    //0.146 ((2-sqrt(2))/4): +-, +j, -+, -i, i+, ij, j-, ji
    prob[0] = 2;
    prob[1] = -1;
    prob[2] = 2; 
    _T_table.insert(make_pair("+-", prob));
    _T_table.insert(make_pair("+j", prob));
    _T_table.insert(make_pair("-+", prob));
    _T_table.insert(make_pair("-i", prob));
    _T_table.insert(make_pair("i+", prob));
    _T_table.insert(make_pair("ij", prob));
    _T_table.insert(make_pair("j-", prob));
    _T_table.insert(make_pair("ji", prob));
    //0.5: 0+, 0-, 0i, 0j, 1+, 1-, 1i, 1j, +0, +1, -0, -1, i0, i1, j0, j1
    prob[0] = 1;
    prob[1] = 0;
    prob[2] = 1;
    _T_table.insert(make_pair("0+", prob));
    _T_table.insert(make_pair("0-", prob));
    _T_table.insert(make_pair("0i", prob));
    _T_table.insert(make_pair("0j", prob));
    _T_table.insert(make_pair("1+", prob));
    _T_table.insert(make_pair("1-", prob));
    _T_table.insert(make_pair("1i", prob));
    _T_table.insert(make_pair("1j", prob));
    _T_table.insert(make_pair("+0", prob));
    _T_table.insert(make_pair("+1", prob));
    _T_table.insert(make_pair("-0", prob));
    _T_table.insert(make_pair("-1", prob));
    _T_table.insert(make_pair("i0", prob));
    _T_table.insert(make_pair("i1", prob));
    _T_table.insert(make_pair("j0", prob));
    _T_table.insert(make_pair("j1", prob));
    //0.707 (sqrt(2)/2): +X, +Y, iY, jX
    prob[0] = 0;
    prob[1] = 1;
    prob[2] = 1;
    _T_table.insert(make_pair("+X", prob));
    _T_table.insert(make_pair("+Y", prob));
    _T_table.insert(make_pair("iY", prob));
    _T_table.insert(make_pair("jX", prob));
    //0.854 ((2+sqrt(2))/4): ++, +i, --, -j, i-, ii, j+, jj
    prob[0] = 2;
    prob[1] = 1;
    prob[2] = 2;
    _T_table.insert(make_pair("++", prob));
    _T_table.insert(make_pair("+i", prob));
    _T_table.insert(make_pair("--", prob));
    _T_table.insert(make_pair("-j", prob));
    _T_table.insert(make_pair("i-", prob));
    _T_table.insert(make_pair("ii", prob));
    _T_table.insert(make_pair("j+", prob));
    _T_table.insert(make_pair("jj", prob));
    //1.0: 00, 0Z, 0I, 11, 1I, +I, -I, iI, jI
    prob[0] = 1;
    prob[1] = 0;
    prob[2] = 0;
    _T_table.insert(make_pair("00", prob));
    _T_table.insert(make_pair("0Z", prob));
    _T_table.insert(make_pair("0I", prob));
    _T_table.insert(make_pair("11", prob));
    _T_table.insert(make_pair("1I", prob));
    _T_table.insert(make_pair("+I", prob));
    _T_table.insert(make_pair("-I", prob));
    _T_table.insert(make_pair("iI", prob));
    _T_table.insert(make_pair("jI", prob));
    //-0.707 (-sqrt(2)/2): -X, -Y, iX, jY
    prob[0] = 0;
    prob[1] = -1;
    prob[2] = 1;
    _T_table.insert(make_pair("-X", prob));
    _T_table.insert(make_pair("-Y", prob));
    _T_table.insert(make_pair("iX", prob));
    _T_table.insert(make_pair("jY", prob));
    //-1.0: 1Z
    prob[0] = -1;
    prob[1] = 0;
    prob[2] = 0;
    _T_table.insert(make_pair("1Z", prob));
    // cout << "T table prepared" << _T_table["1Z"].size() << endl;
    
}

void Observable::parseObservableMap(const string& filename) {
    ifstream infile(filename);
    string line;
    int state = 0; // 0: None, 1: Clifford, 2: T, 3: CCX
    char circuit_type;
    for (int i = 0; i < _numOriginal; ++i) {
        _original_map.push_back(make_pair('I', -1));
    }
    for (int i = 0; i < _numCuts; ++i) {
        _input_map.push_back(make_pair('I', -1));
        _output_map.push_back(make_pair('I', -1));
    }

    int i_Clifford = 0;
    int i_T = 0;
    int i_CCX = 0;
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
            // std::cout << "Parsing Clifford measurements" << endl;
            state = 1;
            continue;
        }
        if (line.find("T gates settings:") != string::npos) {
            // std::cout << "Parsing T gates settings" << endl;
            state = 2;
            continue;
        }
        if (line.find("CCX gates settings:") != string::npos) {
            // std::cout << "Parsing CCX gates settings" << endl;
            state = 3;
            continue;
        }
        if (line.find("Tableau of main Clifford circuit:") != string::npos) {
            // std::cout << "Parsing Tableau" << endl;
            state = 4;
            break;
        }

        // If line is just 'I', add {"I", -1} to the vector
        // cout << line <<endl;
        if (line == "I") {
            if (state == 1) {
                _Clifford_map.push_back(make_pair("I", -1));
                i_Clifford++;
            } else if (state == 2) {
                _T_map.push_back(make_pair("I", -1));
                i_T++;
            } else if (state == 3) {
                _CCX_map.push_back(make_pair("I", -1));
                i_CCX++;
            }
            continue;
        } else if (line == "0") {
            if (state == 1) {
                _Clifford_map.push_back(make_pair("0", -1));
                i_Clifford++;
            } else if (state == 2) {
                _T_map.push_back(make_pair("0", -1));
                i_T++;
            } else if (state == 3) {
                _CCX_map.push_back(make_pair("0", -1));
                i_CCX++;
            }
            continue;
        } else {
            if (state == 1) {
                circuit_type = 'C';
                i_circuit = i_Clifford;
            } else if (state == 2) {
                circuit_type = 'T';
                i_circuit = i_T;
            } else if (state == 3) {
                circuit_type = 'X';
                i_circuit = i_CCX;
            }
            // Split the line into the type (output/input/original) and the associated number
            istringstream iss(line);
            string word1, ignore;
            int num = -1;

            iss >> word1;  // Read the first word (output, input, original)
            
            // If there is a number, it follows the second word (e.g., "cut" or original number)
            if (word1 == "input") {
                iss >> ignore >> ignore >> num;  // Read "cut" and "of" and the associated number
                _input_map[num] = make_pair(circuit_type, i_circuit);
                if (circuit_type == 'C') {
                    _num_delayed_prepare++;
                }
            } else if (word1 == "output") {
                iss >> ignore >> ignore >> num;  // Read "cut" and "of" and the associated number
                _output_map[num] = make_pair(circuit_type, i_circuit);
            } else if (word1 == "original") {
                iss >> num;  // Read the number after "original"
                _original_map[num] = make_pair(circuit_type, i_circuit);
            }
            if (state == 1) {
                _Clifford_map.push_back(make_pair(word1, num));
                // std::cout << "Clifford gate " << i_Clifford << " parsed" << endl;
                i_Clifford++;
                
            } else if (state == 2) {
                _T_map.push_back(make_pair(word1, num));
                // std::cout << "T gate " << i_T / 2 << " parsed" << endl;
                i_T++;
                
            } else if (state == 3) {
                _CCX_map.push_back(make_pair(word1, num));
                // std::cout << "CCX gate " << i_CCX / 6 << " parsed" << endl;
                i_CCX++;
                
            }
            
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
    _iterate_measurement(current_sequence, q, output_prob, 1);
    // cout << "output_prob: " << output_prob[0] << " " << output_prob[1] << " " << output_prob[2] << endl;
    vector<int> prob = _multiply_prob(prob_clifford_vec, output_prob);
    _clifford_simulator.restore();
    return prob;

}

void Observable::_iterate_measurement(vector<char>& current_sequence, string& q, vector<int>& total_prob, int coeff = 1) { // current_sequence: 0I1I0X1X0Y1Y0Z1Z (prepare, measure, prepare, measure, ...)
    if (current_sequence.size() == _input_map.size() * 2) {
        // cout << "current_sequence No. " << _num_obs << endl;
        // for (int i = 0; i < current_sequence.size(); ++i) {
        //     cout << current_sequence[i];
        // }
        // cout << endl;
        _num_obs++;
        vector<int> prob(3);
        prob[0] = 1; // a
        prob[1] = 0; // b
        prob[2] = 0; // k
        // Clifford part
        string clifford_observable = "";
        for (int i = 0; i < _numQubits; ++i) {
            if (_Clifford_map[i].first == "original") {
                if (q[_Clifford_map[i].second] == 'X' || q[_Clifford_map[i].second] == 'Y' || q[_Clifford_map[i].second] == 'Z') {
                    clifford_observable.push_back(q[_Clifford_map[i].second]);
                } else {
                    clifford_observable.push_back('I');
                }
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
                else {
                    throw std::runtime_error("Invalid Clifford delayed prepare setting");
                }
            }
            else if (_Clifford_map[i].first == "I") {
                clifford_observable.push_back('I');
            }
            else {
                throw std::runtime_error("Invalid Clifford setting");
            }
        }
        // cout << "clifford_observable: " << clifford_observable << endl;
        // _clifford_simulator.printTable();
        // cout<<endl;
        _clifford_simulator.measure(clifford_observable);
        pair<int, int> prob_clifford = _clifford_simulator.get_prob();
        vector<int> prob_clifford_vec(3);
        prob_clifford_vec[0] = prob_clifford.first;
        prob_clifford_vec[1] = 0;
        prob_clifford_vec[2] = prob_clifford.second;
        // _clifford_simulator.printTable();
        // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;
        prob = _multiply_prob(prob, prob_clifford_vec);
        // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;

        // T part
        string desired_T = "";
        for (int i=0; i < _T_map.size(); ++i) {
            if (_T_map[i].first == "original") {
                if (q.size() > _T_map[i].second) {
                    desired_T.push_back(q[_T_map[i].second]);
                } else {
                    desired_T.push_back('I');
                }
            }
            else if (_T_map[i].first == "output") {
                desired_T.push_back(current_sequence[_T_map[i].second * 2 + 1]);
            }
            else if (_T_map[i].first == "input") {
                desired_T.push_back(current_sequence[_T_map[i].second * 2]);
            }
            else if (_T_map[i].first == "I") {
                desired_T.push_back('I');
            }
            else if (_T_map[i].first =="0") {
                desired_T.push_back('0');
            }
            else {
                throw std::runtime_error("Invalid T gate setting");
            }
            if (i % 2 == 1) {
                // cout << "desired_T: " << desired_T << endl;
                vector<int> prob_T = _T_table[desired_T];
                // cout << "prob_T: " << prob_T[0] << " " << prob_T[1] << " " << prob_T[2] << endl;
                assert(prob_T.size() == 3);
                prob = _multiply_prob(prob, prob_T);
                // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
                desired_T = "";
            }
        }

        // CCX part
        string desired_CCX = "";
        for (int i = 0; i < _CCX_map.size(); i++) {
            if (_CCX_map[i].first == "original") {
                if (q.size() > _CCX_map[i].second) {
                    desired_CCX.push_back(q[_CCX_map[i].second]);
                } else {
                    desired_CCX.push_back('I');
                }
            }
            else if (_CCX_map[i].first == "output") {
                desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2 + 1]);
            }
            else if (_CCX_map[i].first == "input") {
                desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2]);
            }
            else if (_CCX_map[i].first == "I") {
                desired_CCX.push_back('I');
            }
            else if (_CCX_map[i].first == "0") {
                desired_CCX.push_back('0');
            }
            else {
                throw std::runtime_error("Invalid CCX gate setting");
            }
            if (i % 6 == 5) {
                // cout << "desired_CCX: " << desired_CCX << endl;
                vector<int> prob_CCX = _CCX_table[desired_CCX];
                assert(prob_CCX.size() == 3);
                prob = _multiply_prob(prob, prob_CCX);
                desired_CCX = "";
            }
        }
        vector<int> vector_coeff(3);
        vector_coeff[0] = (1<<_num_delayed_prepare) * coeff;
        vector_coeff[1] = 0;
        vector_coeff[2] = _numCuts;
        // cout << "vector_coeff: " << vector_coeff[0] << " " << vector_coeff[1] << " " << vector_coeff[2] << endl;
        prob = _multiply_prob(prob, vector_coeff);
        // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
        total_prob = _sum_prob(total_prob, prob);
        // cout << "total_prob: " << total_prob[0] << " " << total_prob[1] << " " << total_prob[2] << endl;
        // _clifford_simulator.restore();
        _clifford_simulator.restore_no_delayed_prepare();
    }
    else {
        for (int i = 0; i < _measure_sequence.size(); ++i) {
            current_sequence.push_back(_prepare_sequence[i]);
            current_sequence.push_back(_measure_sequence[i]);
            if (i == 3 || i == 5 || i == 7) {
                _iterate_measurement(current_sequence, q, total_prob, coeff * -1);
            }
            else {
                _iterate_measurement(current_sequence, q, total_prob, coeff);
            }
            
            current_sequence.pop_back();
            current_sequence.pop_back();
        }
    }

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
    _iterate_measurement(current_sequence, q, output_prob, 1);
    // cout << "output_prob: " << output_prob[0] << " " << output_prob[1] << " " << output_prob[2] << endl;
    vector<int> prob = _multiply_prob(prob_clifford_vec, output_prob);
    _clifford_simulator.restore();
    return prob;

}

void Observable::_iterate_measurement(vector<char>& current_sequence, vector<bool>& q, vector<int>& total_prob, int coeff = 1) { // current_sequence: 0I1I0X1X0Y1Y0Z1Z (prepare, measure, prepare, measure, ...)
    if (current_sequence.size() == _input_map.size() * 2) {
        // cout << "current_sequence No. " << _num_obs << endl;
        // for (int i = 0; i < current_sequence.size(); ++i) {
        //     cout << current_sequence[i];
        // }
        // cout << endl;
        _num_obs++;
        vector<int> prob(3);
        prob[0] = 1; // a
        prob[1] = 0; // b
        prob[2] = 0; // k
        // Clifford part
        string clifford_observable = "";
        for (int i = 0; i < _numQubits; ++i) {
            if (_Clifford_map[i].first == "original") {
                // if (q.size() > _Clifford_map[i].second) {
                //     clifford_observable.push_back(q[_Clifford_map[i].second]? '1' : '0');
                // } else {
                //     clifford_observable.push_back('I');
                // }
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
                else {
                    throw std::runtime_error("Invalid Clifford delayed prepare setting");
                }
            }
            else if (_Clifford_map[i].first == "I") {
                clifford_observable.push_back('I');
            }
            else {
                throw std::runtime_error("Invalid Clifford setting");
            }
        }
        // cout << "clifford_observable: " << clifford_observable << endl;
        _clifford_simulator.measure(clifford_observable);
        pair<int, int> prob_clifford = _clifford_simulator.get_prob();
        vector<int> prob_clifford_vec(3);
        prob_clifford_vec[0] = prob_clifford.first;
        prob_clifford_vec[1] = 0;
        prob_clifford_vec[2] = prob_clifford.second;
        // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;
        prob = _multiply_prob(prob, prob_clifford_vec);
        // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;

        // T part
        string desired_T = "";
        for (int i=0; i < _T_map.size(); ++i) {
            if (_T_map[i].first == "original") {
                if (q.size() > _T_map[i].second) {
                    desired_T.push_back(q[_T_map[i].second]? '1' : '0');
                } else {
                    desired_T.push_back('I');
                }
            }
            else if (_T_map[i].first == "output") {
                desired_T.push_back(current_sequence[_T_map[i].second * 2 + 1]);
            }
            else if (_T_map[i].first == "input") {
                desired_T.push_back(current_sequence[_T_map[i].second * 2]);
            }
            else if (_T_map[i].first == "I") {
                desired_T.push_back('I');
            }
            else if (_T_map[i].first =="0") {
                desired_T.push_back('0');
            }
            else {
                throw std::runtime_error("Invalid T gate setting");
            }
            if (i % 2 == 1) {
                // cout << "desired_T: " << desired_T << endl;
                vector<int> prob_T = _T_table[desired_T];
                // cout << "prob_T: " << prob_T[0] << " " << prob_T[1] << " " << prob_T[2] << endl;
                assert(prob_T.size() == 3);
                prob = _multiply_prob(prob, prob_T);
                // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
                desired_T = "";
            }
        }

        // CCX part
        string desired_CCX = "";
        for (int i = 0; i < _CCX_map.size(); i++) {
            if (_CCX_map[i].first == "original") {
                if (q.size() > _CCX_map[i].second) {
                    desired_CCX.push_back(q[_CCX_map[i].second]? '1' : '0');
                } else {
                    desired_CCX.push_back('I');
                }
            }
            else if (_CCX_map[i].first == "output") {
                desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2 + 1]);
            }
            else if (_CCX_map[i].first == "input") {
                desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2]);
            }
            else if (_CCX_map[i].first == "I") {
                desired_CCX.push_back('I');
            }
            else if (_CCX_map[i].first == "0") {
                desired_CCX.push_back('0');
            }
            else {
                throw std::runtime_error("Invalid CCX gate setting");
            }
            if (i % 6 == 5) {
                // cout << "desired_CCX: " << desired_CCX << endl;
                vector<int> prob_CCX = _CCX_table[desired_CCX];
                assert(prob_CCX.size() == 3);
                prob = _multiply_prob(prob, prob_CCX);
                desired_CCX = "";
            }
        }
        vector<int> vector_coeff(3);
        vector_coeff[0] = (1<<_num_delayed_prepare) * coeff;
        vector_coeff[1] = 0;
        vector_coeff[2] = _numCuts;
        // cout << "vector_coeff: " << vector_coeff[0] << " " << vector_coeff[1] << " " << vector_coeff[2] << endl;
        prob = _multiply_prob(prob, vector_coeff);
        // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
        total_prob = _sum_prob(total_prob, prob);
        // cout << "total_prob: " << total_prob[0] << " " << total_prob[1] << " " << total_prob[2] << endl;
        // _clifford_simulator.restore();
        _clifford_simulator.restore_no_delayed_prepare();
    }
    else {
        for (int i = 0; i < _measure_sequence.size(); ++i) {
            current_sequence.push_back(_prepare_sequence[i]);
            current_sequence.push_back(_measure_sequence[i]);
            if (i == 3 || i == 5 || i == 7) {
                _iterate_measurement(current_sequence, q, total_prob, coeff * -1);
            }
            else {
                _iterate_measurement(current_sequence, q, total_prob, coeff);
            }
            
            current_sequence.pop_back();
            current_sequence.pop_back();
        }
    }

}

vector<int> Observable::_multiply_prob(vector<int>& prob1, vector<int>& prob2) {
    vector<int> prob(3);
    prob[0] = prob1[0] * prob2[0] + (2 * prob[1] * prob2[1]);
    prob[1] = prob1[0] * prob2[1] + prob1[1] * prob2[0];
    prob[2] = prob1[2] + prob2[2];
    while (prob[0] % 2 == 0 && prob[1] % 2 == 0 && prob[2] > 0) {
        prob[0] /= 2;
        prob[1] /= 2;
        prob[2]--;
    }
    return prob;
}

vector<int> Observable::_sum_prob(vector<int>& prob1, vector<int>& prob2) {
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

// int main() {
//     string filename = "observable_map.txt";
//     string circuit_filename = "circuit.qasm";
//     string ccx_filename = "Toffoli.csv";
//     Observable obs(filename, circuit_filename, ccx_filename, 9, 4, 5);

//     obs.print_maps();
//     vector<bool> q(5, false);
//     // q[0] = true;
//     // q[1] = true;
//     // q[2] = true;
//     // q[3] = true;
//     // q[4] = true;
//     vector<int> prob = obs.get_output_prob(q);
//     std::cout << "Probability: " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
//     return 0;
// }


// #include "chp_sim.h"
// #include "clifford_T.h"



// using namespace std;
// // Function to check if addition overflows
// bool additionWillOverflow(int a, int b) {
//     // Check for positive overflow
//     if (a > 0 && b > 0 && a > INT_MAX - b) {
//         return true;
//     }
//     // Check for negative overflow
//     if (a < 0 && b < 0 && a < INT_MIN - b) {
//         return true;
//     }
//     return false;  // No overflow
// }

// // Function to check if multiplication overflows
// bool multiplicationWillOverflow(int a, int b) {
//     // Handle special cases
//     if (a == 0 || b == 0) {
//         return false;  // Multiplication with 0 never overflows
//     }

//     // Check for overflow conditions
//     if (a > 0 && b > 0 && a > INT_MAX / b) {
//         return true;  // Positive numbers overflow
//     }
//     if (a < 0 && b < 0 && a < INT_MAX / b) {
//         return true;  // Negative numbers overflow
//     }
//     if (a > 0 && b < 0 && b < INT_MIN / a) {
//         return true;  // Positive and negative overflow
//     }
//     if (a < 0 && b > 0 && a < INT_MIN / b) {
//         return true;  // Negative and positive overflow
//     }

//     return false;  // No overflow
// }

// // Helper function to trim leading and trailing spaces
// std::string trim(const std::string& str) {
//     auto start = str.begin();
//     while (start != str.end() && std::isspace(*start)) {
//         start++;
//     }

//     auto end = str.end();
//     do {
//         end--;
//     } while (std::distance(start, end) > 0 && std::isspace(*end));

//     return std::string(start, end + 1);
// }

// void Observable::load_CXX(const std::string& filename) {
//     std::ifstream file(filename);
//     std::string line;

//     // Check if the file was opened successfully
//     if (!file.is_open()) {
//         std::cerr << "Error: Could not open file " << filename << std::endl;
//     }

//     // Read the CSV line by line
//     while (std::getline(file, line)) {
//         std::stringstream ss(line);
//         std::string input0, input1, input2;
//         std::string measure0, measure1, measure2;
//         std::string ignore0, ignore1, ignore2;
//         std::string prob_str;

//         // Parse the CSV line into variables
//         std::getline(ss, input0, ',');
//         input0 = trim(input0);
//         std::getline(ss, input1, ',');
//         input1 = trim(input1);
//         std::getline(ss, input2, ',');
//         input2 = trim(input2);
//         std::getline(ss, measure0, ',');
//         measure0 = trim(measure0);
//         std::getline(ss, measure1, ',');
//         measure1 = trim(measure1);
//         std::getline(ss, measure2, ',');
//         measure2 = trim(measure2);
//         std::getline(ss, ignore0, ',');
//         std::getline(ss, ignore1, ',');
//         std::getline(ss, ignore2, ',');
//         std::getline(ss, prob_str, ',');
//         prob_str = trim(prob_str);

//         vector<int> prob(3, 0);
//         if (prob_str == "1.0") {
//             prob[0] = 1;
//             prob[2] = 0;
//         } else if (prob_str == "0.0") {
//             prob[0] = 0;
//             prob[2] = 0;
//         } else if (prob_str == "0.5") {
//             prob[0] = 1;
//             prob[2] = 1;
//         } else if (prob_str == "0.25") {
//             prob[0] = 1;
//             prob[2] = 2;
//         } else if (prob_str == "0.125") {
//             prob[0] = 1;
//             prob[2] = 3;
//         } else if (prob_str == "-1.0") {
//             prob[0] = -1;
//             prob[2] = 0;
//         } else if (prob_str == "-0.5") {
//             prob[0] = -1;
//             prob[2] = 1;
//         } else if (prob_str == "-0.25") {
//             prob[0] = -1;
//             prob[2] = 2;
//         } else if (prob_str == "0.75") {
//             prob[0] = 1;
//             prob[2] = 3;
//         } else if (prob_str == "0.625") {
//             prob[0] = 5;
//             prob[2] = 3;
//         } else if (prob_str == "0.375") {
//             prob[0] = 3;
//             prob[2] = 3;
//         } else if (prob_str == "-0.125") {
//             prob[0] = -1;
//             prob[2] = 3;
//         } else if (prob_str == "0.5") {
//             prob[0] = 1;
//             prob[2] = 1;
//         } else if (prob_str == "0.5625") {
//             prob[0] = 9;
//             prob[2] = 4;
//         } else if (prob_str == "0.0625") {
//             prob[0] = 1;
//             prob[2] = 4;
//         } else if (prob_str == "0.3125") {
//             prob[0] = 5;
//             prob[2] = 4;
//         } else {
//             std::cerr << "Error: Unknown probability value " << prob_str << std::endl;
//         }
        
//         // Create the key using input0, measure0, input1, measure1, input2, measure2
//         std::string key = input0 + measure0 + input1 + measure1 + input2 + measure2;

//         // Add the key-value pair to the unordered_map
//         _CCX_table.insert(make_pair(key, prob));
//     }

//     // Close the file
//     file.close();
// }

// void Observable::prepare_T() {
//     vector<int> prob(3, 0);
//     //0.0: 01, 0X, 0Y, 10, 1X, 1Y, +Z, -Z, iZ, jZ
//     _T_table.insert(make_pair("01", prob));
//     _T_table.insert(make_pair("0X", prob));
//     _T_table.insert(make_pair("0Y", prob));
//     _T_table.insert(make_pair("10", prob));
//     _T_table.insert(make_pair("1X", prob));
//     _T_table.insert(make_pair("1Y", prob));
//     _T_table.insert(make_pair("+Z", prob));
//     _T_table.insert(make_pair("-Z", prob));
//     _T_table.insert(make_pair("iZ", prob));
//     _T_table.insert(make_pair("jZ", prob));
//     //0.146 ((2-sqrt(2))/4): +-, +j, -+, -i, i+, ij, j-, ji
//     prob[0] = 2;
//     prob[1] = -1;
//     prob[2] = 2; 
//     _T_table.insert(make_pair("+-", prob));
//     _T_table.insert(make_pair("+j", prob));
//     _T_table.insert(make_pair("-+", prob));
//     _T_table.insert(make_pair("-i", prob));
//     _T_table.insert(make_pair("i+", prob));
//     _T_table.insert(make_pair("ij", prob));
//     _T_table.insert(make_pair("j-", prob));
//     _T_table.insert(make_pair("ji", prob));
//     //0.5: 0+, 0-, 0i, 0j, 1+, 1-, 1i, 1j, +0, +1, -0, -1, i0, i1, j0, j1
//     prob[0] = 1;
//     prob[1] = 0;
//     prob[2] = 1;
//     _T_table.insert(make_pair("0+", prob));
//     _T_table.insert(make_pair("0-", prob));
//     _T_table.insert(make_pair("0i", prob));
//     _T_table.insert(make_pair("0j", prob));
//     _T_table.insert(make_pair("1+", prob));
//     _T_table.insert(make_pair("1-", prob));
//     _T_table.insert(make_pair("1i", prob));
//     _T_table.insert(make_pair("1j", prob));
//     _T_table.insert(make_pair("+0", prob));
//     _T_table.insert(make_pair("+1", prob));
//     _T_table.insert(make_pair("-0", prob));
//     _T_table.insert(make_pair("-1", prob));
//     _T_table.insert(make_pair("i0", prob));
//     _T_table.insert(make_pair("i1", prob));
//     _T_table.insert(make_pair("j0", prob));
//     _T_table.insert(make_pair("j1", prob));
//     //0.707 (sqrt(2)/2): +X, +Y, iY, jX
//     prob[0] = 0;
//     prob[1] = 1;
//     prob[2] = 1;
//     _T_table.insert(make_pair("+X", prob));
//     _T_table.insert(make_pair("+Y", prob));
//     _T_table.insert(make_pair("iY", prob));
//     _T_table.insert(make_pair("jX", prob));
//     //0.854 ((2+sqrt(2))/4): ++, +i, --, -j, i-, ii, j+, jj
//     prob[0] = 2;
//     prob[1] = 1;
//     prob[2] = 2;
//     _T_table.insert(make_pair("++", prob));
//     _T_table.insert(make_pair("+i", prob));
//     _T_table.insert(make_pair("--", prob));
//     _T_table.insert(make_pair("-j", prob));
//     _T_table.insert(make_pair("i-", prob));
//     _T_table.insert(make_pair("ii", prob));
//     _T_table.insert(make_pair("j+", prob));
//     _T_table.insert(make_pair("jj", prob));
//     //1.0: 00, 0Z, 0I, 11, 1I, +I, -I, iI, jI
//     prob[0] = 1;
//     prob[1] = 0;
//     prob[2] = 0;
//     _T_table.insert(make_pair("00", prob));
//     _T_table.insert(make_pair("0Z", prob));
//     _T_table.insert(make_pair("0I", prob));
//     _T_table.insert(make_pair("11", prob));
//     _T_table.insert(make_pair("1I", prob));
//     _T_table.insert(make_pair("+I", prob));
//     _T_table.insert(make_pair("-I", prob));
//     _T_table.insert(make_pair("iI", prob));
//     _T_table.insert(make_pair("jI", prob));
//     //-0.707 (-sqrt(2)/2): -X, -Y, iX, jY
//     prob[0] = 0;
//     prob[1] = -1;
//     prob[2] = 1;
//     _T_table.insert(make_pair("-X", prob));
//     _T_table.insert(make_pair("-Y", prob));
//     _T_table.insert(make_pair("iX", prob));
//     _T_table.insert(make_pair("jY", prob));
//     //-1.0: 1Z
//     prob[0] = -1;
//     prob[1] = 0;
//     prob[2] = 0;
//     _T_table.insert(make_pair("1Z", prob));
//     // cout << "T table prepared" << _T_table["1Z"].size() << endl;
    
// }

// void Observable::parseObservableMap(const string& filename) {
//     ifstream infile(filename);
//     string line;
//     int state = 0; // 0: None, 1: Clifford, 2: T, 3: CCX
//     char circuit_type;
//     for (int i = 0; i < _numOriginal; ++i) {
//         _original_map.push_back(make_pair('I', -1));
//     }
//     for (int i = 0; i < _numCuts; ++i) {
//         _input_map.push_back(make_pair('I', -1));
//         _output_map.push_back(make_pair('I', -1));
//     }

//     int i_Clifford = 0;
//     int i_T = 0;
//     int i_CCX = 0;
//     int i_circuit = 0;

//     // Check if file opened successfully
//     if (!infile) {
//         cerr << "Unable to open file: " << filename << endl;
//         return;
//     }

//     while (getline(infile, line)) {
//         // Ignore the first line or any empty lines
//         if (line.empty()) {
//             continue;
//         }
        

//         if (line.find("Clifford measurements:") != string::npos) {
//             // std::cout << "Parsing Clifford measurements" << endl;
//             state = 1;
//             continue;
//         }
//         if (line.find("T gates settings:") != string::npos) {
//             // std::cout << "Parsing T gates settings" << endl;
//             state = 2;
//             continue;
//         }
//         if (line.find("CCX gates settings:") != string::npos) {
//             // std::cout << "Parsing CCX gates settings" << endl;
//             state = 3;
//             continue;
//         }
//         if (line.find("Tableau of main Clifford circuit:") != string::npos) {
//             // std::cout << "Parsing Tableau" << endl;
//             state = 4;
//             break;
//         }

//         // If line is just 'I', add {"I", -1} to the vector
//         // cout << line <<endl;
//         if (line == "I") {
//             if (state == 1) {
//                 _Clifford_map.push_back(make_pair("I", -1));
//                 i_Clifford++;
//             } else if (state == 2) {
//                 _T_map.push_back(make_pair("I", -1));
//                 i_T++;
//             } else if (state == 3) {
//                 _CCX_map.push_back(make_pair("I", -1));
//                 i_CCX++;
//             }
//             continue;
//         } else if (line == "0") {
//             if (state == 1) {
//                 _Clifford_map.push_back(make_pair("0", -1));
//                 i_Clifford++;
//             } else if (state == 2) {
//                 _T_map.push_back(make_pair("0", -1));
//                 i_T++;
//             } else if (state == 3) {
//                 _CCX_map.push_back(make_pair("0", -1));
//                 i_CCX++;
//             }
//             continue;
//         } else {
//             if (state == 1) {
//                 circuit_type = 'C';
//                 i_circuit = i_Clifford;
//             } else if (state == 2) {
//                 circuit_type = 'T';
//                 i_circuit = i_T;
//             } else if (state == 3) {
//                 circuit_type = 'X';
//                 i_circuit = i_CCX;
//             }
//             // Split the line into the type (output/input/original) and the associated number
//             istringstream iss(line);
//             string word1, ignore;
//             int num = -1;

//             iss >> word1;  // Read the first word (output, input, original)
            
//             // If there is a number, it follows the second word (e.g., "cut" or original number)
//             if (word1 == "input") {
//                 iss >> ignore >> ignore >> num;  // Read "cut" and "of" and the associated number
//                 _input_map[num] = make_pair(circuit_type, i_circuit);
//                 if (circuit_type == 'C') {
//                     _num_delayed_prepare++;
//                 }
//             } else if (word1 == "output") {
//                 iss >> ignore >> ignore >> num;  // Read "cut" and "of" and the associated number
//                 _output_map[num] = make_pair(circuit_type, i_circuit);
//             } else if (word1 == "original") {
//                 iss >> num;  // Read the number after "original"
//                 _original_map[num] = make_pair(circuit_type, i_circuit);
//             }
//             if (state == 1) {
//                 _Clifford_map.push_back(make_pair(word1, num));
//                 // std::cout << "Clifford gate " << i_Clifford << " parsed" << endl;
//                 i_Clifford++;
                
//             } else if (state == 2) {
//                 _T_map.push_back(make_pair(word1, num));
//                 // std::cout << "T gate " << i_T / 2 << " parsed" << endl;
//                 i_T++;
                
//             } else if (state == 3) {
//                 _CCX_map.push_back(make_pair(word1, num));
//                 // std::cout << "CCX gate " << i_CCX / 6 << " parsed" << endl;
//                 i_CCX++;
                
//             }
            
//         }
        
        

        
//     }

//     infile.close();
//     _clifford_simulator.read_tableau(filename);
//     // cout << "Tableau read" << endl;
//     // _clifford_simulator.printTable();
//     // print_maps();
// }

// void Observable::parseCircuit(const std::string& filename) {
//     std::ifstream file(filename);
    
//     if (!file.is_open()) {
//         throw std::runtime_error("Could not open file: " + filename);
//     }

//     std::string line;
    
//     while (std::getline(file, line)) {
//         std::istringstream iss(line);
//         std::string gate;
//         char ignore; // For characters like 'q', '[' and ']', and ','
//         int qubit1, qubit2;

//         iss >> gate;

//         if (gate == "h") {  // Hadamard gate
//             iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
//             cout << "Applying Hadamard gate to qubit " << qubit1 << endl;
//             _clifford_simulator.hadamard(qubit1);
//         } else if (gate == "x") {  // X gate
//             iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
//             cout << "Applying X gate to qubit " << qubit1 << endl;
//             _clifford_simulator.x(qubit1);
//         } else if (gate == "y") {  // Y gate
//             iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
//             cout << "Applying Y gate to qubit " << qubit1 << endl;
//             _clifford_simulator.y(qubit1);
//         } else if (gate == "z") {  // Z gate
//             iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
//             cout << "Applying Z gate to qubit " << qubit1 << endl;
//             _clifford_simulator.z(qubit1);
//         } else if (gate == "cx") {  // CNOT gate
//             iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1],'
//             iss >> ignore >> ignore >> qubit2 >> ignore;  // Read 'q[qubit2];'
//             cout << "Applying CNOT gate to qubits control: " << qubit1 << " and target: " << qubit2 << endl;
//             _clifford_simulator.cnot(qubit1, qubit2);
//         } else if (gate == "s") {  // Phase gate (S gate)
//             iss >> ignore >> ignore >> qubit1 >> ignore;  // Read 'q[qubit1];'
//             cout << "Applying Phase gate to qubit " << qubit1 << endl;
//             _clifford_simulator.phase(qubit1);
//         } else {
//             throw std::runtime_error("Unknown gate: " + gate);
//         }
//     }
//     _clifford_simulator.record();
//     // _clifford_simulator.printTable();
//     file.close();
// }

// vector<int> Observable::get_output_prob(string& q){
//     vector<int> output_prob(3, 0);
//     vector<char> current_sequence;
//     // do the original measurements
//     // string clifford_observable = "";
//     // for (int i = 0; i < _numQubits; ++i) {
//     //     if (_Clifford_map[i].first == "original" && q.size() > _Clifford_map[i].second) {
//     //         clifford_observable.push_back(q[_Clifford_map[i].second]);
            
//     //     } else {
//     //         clifford_observable.push_back('I');
//     //     }
//     // }
//     // cout << "CLIFFORD_observable: " << clifford_observable << endl;
//     // _clifford_simulator.measure(clifford_observable);
//     // get_prob should be called before record since record will reset the probability
//     // pair<int, int> prob_clifford = _clifford_simulator.get_prob();
//     // _clifford_simulator.record_no_delayed_prepare();
//     // vector<int> prob_clifford_vec(3);
//     // prob_clifford_vec[0] = prob_clifford.first;
//     // prob_clifford_vec[1] = 0;
//     // prob_clifford_vec[2] = prob_clifford.second;
//     // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;
//     _iterate_measurement(current_sequence, q, output_prob, 1);
//     cout << "output_prob: " << output_prob[0] << " " << output_prob[1] << " " << output_prob[2] << endl;
//     vector<int> prob = output_prob;//(prob_clifford_vec, output_prob);
//     _clifford_simulator.restore();
//     return prob;

// }

// void Observable::_iterate_measurement(vector<char>& current_sequence, string& q, vector<int>& total_prob, int coeff = 1) { // current_sequence: 0I1I0X1X0Y1Y0Z1Z (prepare, measure, prepare, measure, ...)
//     if (current_sequence.size() == _input_map.size() * 2) {
//         cout << "current_sequence No. " << _num_obs << endl;
//         for (int i = 0; i < current_sequence.size(); ++i) {
//             cout << current_sequence[i];
//         }
//         cout << endl;
//         _num_obs++;
//         vector<int> prob(3);
//         prob[0] = 1; // a
//         prob[1] = 0; // b
//         prob[2] = 0; // k
//         // Clifford part
//         string clifford_observable = "";
//         for (int i = 0; i < _numQubits; ++i) {
//             if (_Clifford_map[i].first == "original") {
//                 if (q.size() > _Clifford_map[i].second) {
//                     clifford_observable.push_back(q[_Clifford_map[i].second]);
//                 } else {
//                     clifford_observable.push_back('I');
//                 }
//                 // clifford_observable.push_back('I');
//             }
//             else if (_Clifford_map[i].first == "output") {
//                 clifford_observable.push_back(current_sequence[_Clifford_map[i].second * 2 + 1]);
//             }
//             else if (_Clifford_map[i].first == "input") {
//                 if (current_sequence[_Clifford_map[i].second * 2] == '0') {
//                     clifford_observable.push_back('1');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == '1') {
//                     clifford_observable.push_back('0');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == '+') {
//                     clifford_observable.push_back('-');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == '-') {
//                     clifford_observable.push_back('+');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == 'i') {
//                     clifford_observable.push_back('j');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == 'j') {
//                     clifford_observable.push_back('i');
//                 }
//                 else {
//                     throw std::runtime_error("Invalid Clifford delayed prepare setting");
//                 }
//             }
//             else if (_Clifford_map[i].first == "I") {
//                 clifford_observable.push_back('I');
//             }
//             else {
//                 throw std::runtime_error("Invalid Clifford setting");
//             }
//         }
//         cout << "clifford_observable: " << clifford_observable << endl;
//         _clifford_simulator.printTable();
//         cout << endl;
//         _clifford_simulator.measure(clifford_observable);
//         pair<int, int> prob_clifford = _clifford_simulator.get_prob();
//         _clifford_simulator.printTable();
//         vector<int> prob_clifford_vec(3);
//         prob_clifford_vec[0] = prob_clifford.first;
//         prob_clifford_vec[1] = 0;
//         prob_clifford_vec[2] = prob_clifford.second;
//         cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;
//         prob = _multiply_prob(prob, prob_clifford_vec);
//         cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;

//         // T part
//         string desired_T = "";
//         for (int i=0; i < _T_map.size(); ++i) {
//             if (_T_map[i].first == "original") {
//                 if (q.size() > _T_map[i].second) {
//                     desired_T.push_back(q[_T_map[i].second]);
//                 } else {
//                     desired_T.push_back('I');
//                 }
//             }
//             else if (_T_map[i].first == "output") {
//                 desired_T.push_back(current_sequence[_T_map[i].second * 2 + 1]);
//             }
//             else if (_T_map[i].first == "input") {
//                 desired_T.push_back(current_sequence[_T_map[i].second * 2]);
//             }
//             else if (_T_map[i].first == "I") {
//                 desired_T.push_back('I');
//             }
//             else if (_T_map[i].first =="0") {
//                 desired_T.push_back('0');
//             }
//             else {
//                 throw std::runtime_error("Invalid T gate setting");
//             }
//             if (i % 2 == 1) {
//                 cout << "desired_T: " << desired_T << endl;
//                 vector<int> prob_T = _T_table[desired_T];
//                 cout << "prob_T: " << prob_T[0] << " " << prob_T[1] << " " << prob_T[2] << endl;
//                 assert(prob_T.size() == 3);
//                 prob = _multiply_prob(prob, prob_T);
//                 cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
//                 desired_T = "";
//             }
//         }

//         // CCX part
//         string desired_CCX = "";
//         for (int i = 0; i < _CCX_map.size(); i++) {
//             if (_CCX_map[i].first == "original") {
//                 if (q.size() > _CCX_map[i].second) {
//                     desired_CCX.push_back(q[_CCX_map[i].second]);
//                 } else {
//                     desired_CCX.push_back('I');
//                 }
//             }
//             else if (_CCX_map[i].first == "output") {
//                 desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2 + 1]);
//             }
//             else if (_CCX_map[i].first == "input") {
//                 desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2]);
//             }
//             else if (_CCX_map[i].first == "I") {
//                 desired_CCX.push_back('I');
//             }
//             else if (_CCX_map[i].first == "0") {
//                 desired_CCX.push_back('0');
//             }
//             else {
//                 throw std::runtime_error("Invalid CCX gate setting");
//             }
//             if (i % 6 == 5) {
//                 // cout << "desired_CCX: " << desired_CCX << endl;
//                 vector<int> prob_CCX = _CCX_table[desired_CCX];
//                 assert(prob_CCX.size() == 3);
//                 prob = _multiply_prob(prob, prob_CCX);
//                 desired_CCX = "";
//             }
//         }
//         vector<int> vector_coeff(3);
//         vector_coeff[0] = (1<<_num_delayed_prepare) * coeff;
//         vector_coeff[1] = 0;
//         vector_coeff[2] = _numCuts;
//         cout << "vector_coeff: " << vector_coeff[0] << " " << vector_coeff[1] << " " << vector_coeff[2] << endl;
//         prob = _multiply_prob(prob, vector_coeff);
//         cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
//         total_prob = _sum_prob(total_prob, prob);
//         cout << "total_prob: " << total_prob[0] << " " << total_prob[1] << " " << total_prob[2] << endl;
//         _clifford_simulator.restore();
//         // _clifford_simulator.restore_no_delayed_prepare();
//     }
//     else {
//         for (int i = 0; i < _measure_sequence.size(); ++i) {
//             current_sequence.push_back(_prepare_sequence[i]);
//             current_sequence.push_back(_measure_sequence[i]);
//             if (i == 3 || i == 5 || i == 7) {
//                 _iterate_measurement(current_sequence, q, total_prob, coeff * -1);
//             }
//             else {
//                 _iterate_measurement(current_sequence, q, total_prob, coeff);
//             }
            
//             current_sequence.pop_back();
//             current_sequence.pop_back();
//         }
//     }

// }

// vector<int> Observable::get_output_prob(vector<bool>& q){
//     vector<int> output_prob(3, 0);
//     vector<char> current_sequence;
//     // do the original measurements
//     string clifford_observable = "";
//     for (int i = 0; i < _numQubits; ++i) {
//         if (_Clifford_map[i].first == "original" && q.size() > _Clifford_map[i].second) {
//             clifford_observable.push_back(q[_Clifford_map[i].second]? '1' : '0');
            
//         } else {
//             clifford_observable.push_back('I');
//         }
//     }
//     // cout << "CLIFFORD_observable: " << clifford_observable << endl;
//     _clifford_simulator.measure(clifford_observable);
//     // get_prob should be called before record since record will reset the probability
//     pair<int, int> prob_clifford = _clifford_simulator.get_prob();
//     _clifford_simulator.record_no_delayed_prepare();
//     vector<int> prob_clifford_vec(3);
//     prob_clifford_vec[0] = prob_clifford.first;
//     prob_clifford_vec[1] = 0;
//     prob_clifford_vec[2] = prob_clifford.second;
//     // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;
//     _iterate_measurement(current_sequence, q, output_prob, 1);
//     // cout << "output_prob: " << output_prob[0] << " " << output_prob[1] << " " << output_prob[2] << endl;
//     vector<int> prob = _multiply_prob(prob_clifford_vec, output_prob);
//     _clifford_simulator.restore();
//     return prob;

// }

// void Observable::_iterate_measurement(vector<char>& current_sequence, vector<bool>& q, vector<int>& total_prob, int coeff = 1) { // current_sequence: 0I1I0X1X0Y1Y0Z1Z (prepare, measure, prepare, measure, ...)
//     if (current_sequence.size() == _input_map.size() * 2) {
//         // cout << "current_sequence No. " << _num_obs << endl;
//         // for (int i = 0; i < current_sequence.size(); ++i) {
//         //     cout << current_sequence[i];
//         // }
//         // cout << endl;
//         _num_obs++;
//         vector<int> prob(3);
//         prob[0] = 1; // a
//         prob[1] = 0; // b
//         prob[2] = 0; // k
//         // Clifford part
//         string clifford_observable = "";
//         for (int i = 0; i < _numQubits; ++i) {
//             if (_Clifford_map[i].first == "original") {
//                 // if (q.size() > _Clifford_map[i].second) {
//                 //     clifford_observable.push_back(q[_Clifford_map[i].second]? '1' : '0');
//                 // } else {
//                 //     clifford_observable.push_back('I');
//                 // }
//                 clifford_observable.push_back('I');
//             }
//             else if (_Clifford_map[i].first == "output") {
//                 clifford_observable.push_back(current_sequence[_Clifford_map[i].second * 2 + 1]);
//             }
//             else if (_Clifford_map[i].first == "input") {
//                 if (current_sequence[_Clifford_map[i].second * 2] == '0') {
//                     clifford_observable.push_back('1');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == '1') {
//                     clifford_observable.push_back('0');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == '+') {
//                     clifford_observable.push_back('-');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == '-') {
//                     clifford_observable.push_back('+');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == 'i') {
//                     clifford_observable.push_back('j');
//                 }
//                 else if (current_sequence[_Clifford_map[i].second * 2] == 'j') {
//                     clifford_observable.push_back('i');
//                 }
//                 else {
//                     throw std::runtime_error("Invalid Clifford delayed prepare setting");
//                 }
//             }
//             else if (_Clifford_map[i].first == "I") {
//                 clifford_observable.push_back('I');
//             }
//             else {
//                 throw std::runtime_error("Invalid Clifford setting");
//             }
//         }
//         // cout << "clifford_observable: " << clifford_observable << endl;
//         _clifford_simulator.measure(clifford_observable);
//         pair<int, int> prob_clifford = _clifford_simulator.get_prob();
//         vector<int> prob_clifford_vec(3);
//         prob_clifford_vec[0] = prob_clifford.first;
//         prob_clifford_vec[1] = 0;
//         prob_clifford_vec[2] = prob_clifford.second;
//         // cout << "prob_clifford: " << prob_clifford_vec[0] << " " << prob_clifford_vec[1] << " " << prob_clifford_vec[2] << endl;
//         prob = _multiply_prob(prob, prob_clifford_vec);
//         // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;

//         // T part
//         string desired_T = "";
//         for (int i=0; i < _T_map.size(); ++i) {
//             if (_T_map[i].first == "original") {
//                 if (q.size() > _T_map[i].second) {
//                     desired_T.push_back(q[_T_map[i].second]? '1' : '0');
//                 } else {
//                     desired_T.push_back('I');
//                 }
//             }
//             else if (_T_map[i].first == "output") {
//                 desired_T.push_back(current_sequence[_T_map[i].second * 2 + 1]);
//             }
//             else if (_T_map[i].first == "input") {
//                 desired_T.push_back(current_sequence[_T_map[i].second * 2]);
//             }
//             else if (_T_map[i].first == "I") {
//                 desired_T.push_back('I');
//             }
//             else if (_T_map[i].first =="0") {
//                 desired_T.push_back('0');
//             }
//             else {
//                 throw std::runtime_error("Invalid T gate setting");
//             }
//             if (i % 2 == 1) {
//                 // cout << "desired_T: " << desired_T << endl;
//                 vector<int> prob_T = _T_table[desired_T];
//                 // cout << "prob_T: " << prob_T[0] << " " << prob_T[1] << " " << prob_T[2] << endl;
//                 assert(prob_T.size() == 3);
//                 prob = _multiply_prob(prob, prob_T);
//                 // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
//                 desired_T = "";
//             }
//         }

//         // CCX part
//         string desired_CCX = "";
//         for (int i = 0; i < _CCX_map.size(); i++) {
//             if (_CCX_map[i].first == "original") {
//                 if (q.size() > _CCX_map[i].second) {
//                     desired_CCX.push_back(q[_CCX_map[i].second]? '1' : '0');
//                 } else {
//                     desired_CCX.push_back('I');
//                 }
//             }
//             else if (_CCX_map[i].first == "output") {
//                 desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2 + 1]);
//             }
//             else if (_CCX_map[i].first == "input") {
//                 desired_CCX.push_back(current_sequence[_CCX_map[i].second * 2]);
//             }
//             else if (_CCX_map[i].first == "I") {
//                 desired_CCX.push_back('I');
//             }
//             else if (_CCX_map[i].first == "0") {
//                 desired_CCX.push_back('0');
//             }
//             else {
//                 throw std::runtime_error("Invalid CCX gate setting");
//             }
//             if (i % 6 == 5) {
//                 // cout << "desired_CCX: " << desired_CCX << endl;
//                 vector<int> prob_CCX = _CCX_table[desired_CCX];
//                 assert(prob_CCX.size() == 3);
//                 prob = _multiply_prob(prob, prob_CCX);
//                 desired_CCX = "";
//             }
//         }
//         vector<int> vector_coeff(3);
//         vector_coeff[0] = (1<<_num_delayed_prepare) * coeff;
//         vector_coeff[1] = 0;
//         vector_coeff[2] = _numCuts;
//         // cout << "vector_coeff: " << vector_coeff[0] << " " << vector_coeff[1] << " " << vector_coeff[2] << endl;
//         prob = _multiply_prob(prob, vector_coeff);
//         // cout << "prob: " << prob[0] << " " << prob[1] << " " << prob[2] << endl;
//         total_prob = _sum_prob(total_prob, prob);
//         // cout << "total_prob: " << total_prob[0] << " " << total_prob[1] << " " << total_prob[2] << endl;
//         // _clifford_simulator.restore();
//         _clifford_simulator.restore_no_delayed_prepare();
//     }
//     else {
//         for (int i = 0; i < _measure_sequence.size(); ++i) {
//             current_sequence.push_back(_prepare_sequence[i]);
//             current_sequence.push_back(_measure_sequence[i]);
//             if (i == 3 || i == 5 || i == 7) {
//                 _iterate_measurement(current_sequence, q, total_prob, coeff * -1);
//             }
//             else {
//                 _iterate_measurement(current_sequence, q, total_prob, coeff);
//             }
            
//             current_sequence.pop_back();
//             current_sequence.pop_back();
//         }
//     }

// }

// vector<int> Observable::_multiply_prob(vector<int>& prob1, vector<int>& prob2) {
//     vector<int> prob(3);
//     prob[0] = prob1[0] * prob2[0] + (2 * prob[1] * prob2[1]);
//     prob[1] = prob1[0] * prob2[1] + prob1[1] * prob2[0];
//     prob[2] = prob1[2] + prob2[2];
//     while (prob[0] % 2 == 0 && prob[1] % 2 == 0 && prob[2] > 0) {
//         prob[0] /= 2;
//         prob[1] /= 2;
//         prob[2]--;
//     }
//     return prob;
// }

// vector<int> Observable::_sum_prob(vector<int>& prob1, vector<int>& prob2) {
//     vector<int> prob(3);
//     if (prob1[2] > prob2[2]) {
//         prob[0] = prob1[0] + ((1<<(prob1[2]-prob2[2])) * prob2[0]);
//         prob[1] = prob1[1] + ((1<<(prob1[2]-prob2[2])) * prob2[1]);
//         prob[2] = prob1[2];
//     }
//     else {
//         prob[0] = prob2[0] + ((1<<(prob2[2]-prob1[2])) * prob1[0]);
//         prob[1] = prob2[1] + ((1<<(prob2[2]-prob1[2])) * prob1[1]);
//         prob[2] = prob2[2];
//     }
//     while (prob[0] % 2 == 0 && prob[1] % 2 == 0 && prob[2] > 0) {
//         prob[0] /= 2;
//         prob[1] /= 2;
//         prob[2]--;
//     }
//     return prob;
// }

// void Observable::print_maps(){
//     std::cout << "Clifford map:" << endl;
//     for (const auto& p : _Clifford_map) {
//         std::cout << "{" << p.first << ", " << p.second << "}" << endl;
//     }
//     std::cout << "T map:" << endl;
//     for (const auto& p : _T_map) {
//         std::cout << "{" << p.first << ", " << p.second << "}" << endl;
//     }
//     std::cout << "CCX map:" << endl;
//     for (const auto& p : _CCX_map) {
//         std::cout << "{" << p.first << ", " << p.second << "}" << endl;
//     }
//     std::cout << "Original map:" << endl;
//     for (const auto& p : _original_map) {
//         std::cout << "{" << p.first << ", " << p.second << "}" << endl;
//     }
// }

// // int main() {
// //     string filename = "observable_map.txt";
// //     string circuit_filename = "circuit.qasm";
// //     string ccx_filename = "Toffoli.csv";
// //     Observable obs(filename, circuit_filename, ccx_filename, 9, 4, 5);

// //     obs.print_maps();
// //     vector<bool> q(5, false);
// //     // q[0] = true;
// //     // q[1] = true;
// //     // q[2] = true;
// //     // q[3] = true;
// //     // q[4] = true;
// //     vector<int> prob = obs.get_output_prob(q);
// //     std::cout << "Probability: " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
// //     return 0;
// // }