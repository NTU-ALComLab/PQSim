#include "chp_sim.h"

#include <stdexcept>

// Function to clean tokens by removing '[' and ']' characters
std::string clean_token(const std::string& token) {
    std::string cleaned = token;
    cleaned.erase(std::remove(cleaned.begin(), cleaned.end(), '['), cleaned.end());
    cleaned.erase(std::remove(cleaned.begin(), cleaned.end(), ']'), cleaned.end());
    return cleaned;
}


// Constructor to initialize the table and set pointers to sub-arrays
ChpSimulator::ChpSimulator(int num_qubits)
    : _n(num_qubits),
        _tableau(2 * num_qubits, std::vector<bool>(2 * num_qubits + 1, false)),
        _no_measure_table(2 * num_qubits, std::vector<bool>(2 * num_qubits + 1, false)),
        _no_delayed_prepare_table(2 * num_qubits, std::vector<bool>(2 * num_qubits + 1, false)),
        l(1), 
        n_pow(0),
        l_delayed_prepare(1),
        n_pow_delayed_prepare(0) {
    for (int i = 0; i < 2 * num_qubits; ++i) {
        _tableau[i][i] = true;
    }
}

// Applies a CNOT gate between two qubits
void ChpSimulator::cnot(int control, int target) {
    for (int i = 0; i < 2 * _n + 1; ++i) {
        _tableau[i][2 * _n] = (_tableau[i][2 * _n] != (_tableau[i][control] && _tableau[i][target + _n] && ((_tableau[i][target] != _tableau[i][control + _n]) != true)));
        _tableau[i][target] = (_tableau[i][target] !=_tableau[i][control]);
        _tableau[i][control + _n] = (_tableau[i][control + _n] != _tableau[i][target + _n]);
    }
}

// Applies a Hadamard gate to a qubit
void ChpSimulator::hadamard(int qubit) {
    for (int i = 0; i < 2 * _n + 1; ++i) {
        _tableau[i][2 * _n] = (_tableau[i][2 * _n] != (_tableau[i][qubit] && _tableau[i][qubit + _n]));
        // // XOR swap for X and Z
        // _x[i][qubit] = (_x[i][qubit] != _z[i][qubit]);
        // _z[i][qubit] = (_z[i][qubit] != _x[i][qubit]);
        // _x[i][qubit] = (_x[i][qubit] != _z[i][qubit]);
        std::swap(_tableau[i][qubit], _tableau[i][qubit + _n]);
    }
}

// Applies a phase (S) gate to a qubit
void ChpSimulator::phase(int qubit) {
    for (int i = 0; i < 2 * _n + 1; ++i) {
        _tableau[i][2 * _n] = (_tableau[i][2 * _n] != (_tableau[i][qubit] && _tableau[i][qubit + _n]));
        _tableau[i][qubit + _n] = (_tableau[i][qubit + _n] != _tableau[i][qubit]);
    }
}

// Applies an X gate to a qubit
void ChpSimulator::x(int qubit) {
    for (int i = 0; i < 2 * _n + 1; ++i) {
        _tableau[i][2 * _n] = (_tableau[i][2 * _n] != _tableau[i][qubit + _n]);
    }
}

// Applies a Y gate to a qubit
void ChpSimulator::y(int qubit) {
    for (int i = 0; i < 2 * _n + 1; ++i) {
        _tableau[i][2 * _n] = (_tableau[i][2 * _n] != (_tableau[i][qubit] != _tableau[i][qubit + _n]));
    }
}

// Applies a Z gate to a qubit
void ChpSimulator::z(int qubit) {
    for (int i = 0; i < 2 * _n + 1; ++i) {
        _tableau[i][2 * _n] = (_tableau[i][2 * _n] != _tableau[i][qubit]);
    }
}

void ChpSimulator::read_tableau(const std::string& filename) {
    int rows = 2 * _n + 1;
    int cols = 2 * _n + 1;
    std::ifstream file(filename);
    
    if (!file.is_open()) {
        throw std::runtime_error("Could not open file: " + filename);
    }

    std::string line;
    int row = 0;
    bool read = false;
    while (std::getline(file, line) && row < rows) {
        std::istringstream iss(line);
        std::string token;
        // std::cout << "line: " << line << std::endl;
        if (line.find("Tableau of main Clifford circuit:") != std::string::npos) {
            // std::cout << "Parsing Tableau" << std::endl;
            read = true;
            continue;
        }
        if (!read) {
            continue;
        }
        // // Find the start of the matrix (i.e., after "[[")
        // size_t start_pos = line.find("[[");
        // if (start_pos != std::string::npos) {
        //     line = line.substr(start_pos + 2);
        // }

        // Parse the line into booleans
        int col = 0;
        while (iss >> token) {
            token = clean_token(token);  // Remove square brackets
            if (!token.empty()) {
                _no_measure_table[row][col] = (token == "1");         // Store '1' as true, '0' as false
                col++;
            }
        }

        row++;
    }

    // for (int i = 0; i < _no_measure_table.size(); ++i) {
    //     for (int j = 0; j < _no_measure_table[i].size(); ++j) {
    //         std::cout << _no_measure_table[i][j] << " ";
    //     }
    //     std::cout << std::endl;
    // }

    file.close();
    restore();
    // printTable();
}

// Record the current state of the simulator
void ChpSimulator::record() {
    _no_measure_table = _tableau;
}

void ChpSimulator::record_no_delayed_prepare() {
    _no_delayed_prepare_table = _tableau;
    l = 1;
    n_pow = 0;
    l_delayed_prepare = 1;
    n_pow_delayed_prepare = 0;
}

// Restore the last recorded state
void ChpSimulator::restore() {
    if (_no_measure_table.empty()) {
        throw std::runtime_error("No recorded state to restore.");
    }
    _tableau = _no_measure_table;
    l = 1;
    n_pow = 0;
    l_delayed_prepare = 1;
    n_pow_delayed_prepare = 0;
}

void ChpSimulator::restore_no_delayed_prepare() {
    if (_no_delayed_prepare_table.empty()) {
        throw std::runtime_error("No recorded state to restore.");
    }
    _tableau = _no_delayed_prepare_table;
    l = 1;
    n_pow = 0;
    l_delayed_prepare = 1;
    n_pow_delayed_prepare = 0;
}

void ChpSimulator::measure(std::string observable) {
    // printTable();
    int I_count = 0;
    // std::cout << "Transform to Z basis" << std::endl;
    for (int jth_row = 0; jth_row < 2 * _n; ++jth_row) {
        for (int ith_qubit = 0; ith_qubit < _n; ++ith_qubit) {
            if (observable[ith_qubit] == 'i' || observable[ith_qubit] == 'j' || observable[ith_qubit] == 'Y') {
                _tableau[jth_row][ith_qubit + _n] = (_tableau[jth_row][ith_qubit] != _tableau[jth_row][ith_qubit + _n]);
                _tableau[jth_row][2 * _n] = (_tableau[jth_row][2 * _n] != (_tableau[jth_row][ith_qubit] && _tableau[jth_row][ith_qubit + _n]));
            }
            if (observable[ith_qubit] == '+' || observable[ith_qubit] == '-' || observable[ith_qubit] == 'X' || 
                observable[ith_qubit] == 'i' || observable[ith_qubit] == 'j' || observable[ith_qubit] == 'Y') {
                _tableau[jth_row][2 * _n] = (_tableau[jth_row][2 * _n] != (_tableau[jth_row][ith_qubit] && _tableau[jth_row][ith_qubit + _n]));
                std::swap(_tableau[jth_row][ith_qubit], _tableau[jth_row][ith_qubit + _n]);
            }
            // std::cout << "jth_row: " << jth_row << " ith_qubit: " << ith_qubit << std::endl;
            // printTable();
            // std::cout << std::endl;
        }
    }
    // std::cout << "Transform to Z basis middle" << std::endl;
    for (int ith_qubit = 0; ith_qubit < _n; ++ith_qubit) {
        if (observable[ith_qubit] == 'X' || observable[ith_qubit] == 'Y') {
            observable[ith_qubit] = 'Z';
        } else if (observable[ith_qubit] == '+' || observable[ith_qubit] == 'i') {
            observable[ith_qubit] = '0';
        } else if (observable[ith_qubit] == '-' || observable[ith_qubit] == 'j') {
            observable[ith_qubit] = '1';
        }
    }

    for (int ith_qubit = 0; ith_qubit < _n; ++ith_qubit) {
        if (observable[ith_qubit] == '0' || observable[ith_qubit] == '1') {
            bool has_anticommute = false;
            int first_anticommute_row_idx = -1;
            std::vector<bool> first_anticommute_row(2 * _n + 1, false);
            // std::cout << "ith_qubit: " << ith_qubit << " first_anticommute_row_idx: " << first_anticommute_row_idx << std::endl;
            // std::cout << "first_anticommute_row: ";
            // for (int i = 0; i < first_anticommute_row.size(); ++i) {
            //     std::cout << first_anticommute_row[i] << " ";
            // }
            // std::cout << std::endl;
            // std::cout << "tableau: " << std::endl;
            // printTable();
            // std::cout << std::endl;
            for (int jth_row = _n; jth_row < 2 * _n; ++jth_row) {
                if (_tableau[jth_row][ith_qubit]) {
                    // std::cout << "jth_row: " << jth_row << std::endl;
                    // for (int i = 0; i < _tableau[jth_row].size(); ++i) {
                    //     std::cout << _tableau[jth_row][i] << " ";
                    // }
                    // std::cout << std::endl;
                    // std::cout << "first_anticommute_row: ";
                    // for (int i = 0; i < first_anticommute_row.size(); ++i) {
                    //     std::cout << first_anticommute_row[i] << " ";
                    // }
                    _tableau[jth_row] = _row_sum(first_anticommute_row, _tableau[jth_row]);
                    // std::cout << std::endl;
                    // for(int i = 0; i < _tableau[jth_row].size(); ++i) {
                    //     std::cout << _tableau[jth_row][i] << " ";
                    // }
                    // std::cout << std::endl;
                    if (!has_anticommute) {
                        first_anticommute_row_idx = jth_row;
                        first_anticommute_row = _tableau[jth_row];
                    }
                    has_anticommute = true;
                }
            }
            // std::cout << "ith_qubit: " << ith_qubit << " first_anticommute_row_idx: " << first_anticommute_row_idx << std::endl;
            // std::cout << "first_anticommute_row: ";
            // for (int i = 0; i < first_anticommute_row.size(); ++i) {
            //     std::cout << first_anticommute_row[i] << " ";
            // }
            // std::cout << std::endl;
            // std::cout << "tableau: " << std::endl;
            // printTable();
            // std::cout << std::endl;

            if (has_anticommute) {
                n_pow++;

                for (int jth_row = 0; jth_row < _n; ++jth_row) {
                    if (jth_row == first_anticommute_row_idx - _n) {
                        continue;
                    }
                    if (_tableau[jth_row][ith_qubit]) {
                        _tableau[jth_row] = _row_sum(first_anticommute_row, _tableau[jth_row]);
                        
                    }
                }

                _tableau[first_anticommute_row_idx - _n] = _tableau[first_anticommute_row_idx];
                _tableau[first_anticommute_row_idx] = std::vector<bool>(2 * _n + 1, false);
                _tableau[first_anticommute_row_idx][ith_qubit + _n] = true;
                _tableau[first_anticommute_row_idx][2 * _n] = (observable[ith_qubit] == '1');
            } else {
                std::vector<bool> is_taken(_n, false);
                for (int jth_row = 0; jth_row < _n; ++jth_row) {
                    if (_tableau[jth_row][ith_qubit]) {
                        is_taken[jth_row] = true;
                    }
                }

                std::vector<bool> ancilla_row(2 * _n + 1, false);
                for (int jth_row = 0; jth_row < _n; ++jth_row) {
                    if (is_taken[jth_row]) {
                        ancilla_row = _row_sum(_tableau[jth_row + _n], ancilla_row);
                    }
                }

                if (ancilla_row[_n * 2] != (observable[ith_qubit] == '1')) {
                    l = 0;
                    n_pow = 0;
                    return; // Such a state is impossible
                }
            }
            observable[ith_qubit] = 'I';
        }
    }

    std::vector<bool> observable_row = _observable_to_tableau(observable);

    for (int jth_row = _n; jth_row < 2 * _n; ++jth_row) {
        if (!_is_commute(observable_row, _tableau[jth_row])) {
            l = 0;
            n_pow = 0;
            return; // expectation value is zero
        }
    }

    std::vector<bool> is_taken(_n, false);
    for (int jth_row = 0; jth_row < _n; ++jth_row) {
        if (!_is_commute(observable_row, _tableau[jth_row])) {
            is_taken[jth_row] = true;
        }
    }

    std::vector<bool> ancilla_row(2 * _n + 1, false);
    for (int jth_row = 0; jth_row < _n; ++jth_row) {
        if (is_taken[jth_row]) {
            ancilla_row = _row_sum(_tableau[jth_row + _n], ancilla_row);
        }
    }

    if (ancilla_row[_n * 2]) {
        l *= -1;
    }

}


bool ChpSimulator::_is_commute(std::vector<bool>& row1, std::vector<bool>& row2) {
    bool answer = true;
    for (int i = 0; i < _n; ++i) {
        answer = (answer != (row1[i] && row2[i + _n]));
        answer = (answer != (row2[i] && row1[i + _n]));
    }
    return answer;
}

std::vector<bool> ChpSimulator::_row_sum(std::vector<bool>& row1, std::vector<bool>& row2) {
    // Use vector constructor with initializer list
    std::array<bool, 2> X = {true, false};
    std::array<bool, 2> Y = {true, true};
    std::array<bool, 2> Z = {false, true};
    std::array<bool, 4> X_Y = {X[0], X[1], Y[0], Y[1]};
    std::array<bool, 4> Y_Z = {Y[0], Y[1], Z[0], Z[1]};
    std::array<bool, 4> Z_X = {Z[0], Z[1], X[0], X[1]};
    std::array<bool, 4> X_Z = {X[0], X[1], Z[0], Z[1]};
    std::array<bool, 4> Z_Y = {Z[0], Z[1], Y[0], Y[1]};
    std::array<bool, 4> Y_X = {Y[0], Y[1], X[0], X[1]};

    std::vector<bool> new_row(2 * _n + 1, false);
    int phase_shift = 0;
    if (row1[_n * 2]) {
        phase_shift += 2;
    }
    if (row2[_n * 2]) {
        phase_shift += 2;
    }
    for (int i = 0; i < _n; ++i) {
        new_row[i] = (row1[i] != row2[i]);
        new_row[i + _n] = (row1[i + _n] != row2[i + _n]);
        // Check for phase shift conditions
        // Check for phase shift conditions
        std::array<bool, 4> check = {row1[i], row1[_n + i], row2[i], row2[_n + i]};

        // Use array for comparison
        if (check == X_Y || 
            check == Y_Z || 
            check == Z_X) {
            phase_shift += 1;
        } 
        else if (check == X_Z || 
                 check == Z_Y || 
                 check == Y_X) {
            phase_shift -= 1;
        }
        // std::cout << "i: " << i << " phase_shift: " << phase_shift << std::endl;
    }
    assert(phase_shift % 2 == 0);  // Ensures phase_shift is even

    phase_shift = phase_shift % 4;
    // std::cout << "phase_shift: " << phase_shift << std::endl;
    if (phase_shift == 2 || phase_shift == -2) {
        new_row[_n * 2] = true;
    }
    return new_row;
}

std::vector<bool> ChpSimulator::_observable_to_tableau(std::string& observable) {
    std::vector<bool> tableau(2 * _n + 1, false);
    for (int i = 0; i < _n; ++i) {
        if (observable[i] == 'X' || observable[i] == 'Y') {
            tableau[i] = true;
        }
        if (observable[i] == 'Y' || observable[i] == 'Z') {
            tableau[i + _n] = true;
        }
    }
    return tableau;
}

std::pair<int, int> ChpSimulator::get_prob() {
    return std::make_pair(l, n_pow);
}

// Print the current state of the simulator
void ChpSimulator::printTable() const {
    for (int i = 0; i < _tableau.size(); ++i) {
        std::cout << "Row " << i << ": ";
        for (int j = 0; j < _tableau[0].size(); ++j) {
            std::cout << _tableau[i][j] << " ";
        }
        std::cout << std::endl;
    }
}



// int main() {
//     // Example usage
//     int num_qubits = 2;
//     ChpSimulator simulator(num_qubits);

//     std::cout << "Initial table:\n";
//     simulator.printTable();

//     simulator.hadamard(0);
//     std::cout << "\nAfter applying Hadamard gate:\n";
//     simulator.printTable();

//     simulator.cnot(0, 1);
//     std::cout << "\nAfter applying CNOT gate:\n";
//     simulator.printTable();

//     // simulator.phase(1);
//     // std::cout << "\nAfter applying Phase gate:\n";
//     // simulator.printTable();

//     simulator.record();
//     std::cout << "\nState recorded.\n";

//     simulator.measure(0, false, 'Z');
//     std::pair<int, int> prob_0 = simulator.get_prob();
//     std::cout << "Probability: " << prob_0.first << " / " << (1 << prob_0.second) << std::endl;
//     simulator.printTable();
//     simulator.measure(1, false, 'Z');
//     std::pair<int, int> prob_00 = simulator.get_prob();
//     std::cout << "Probability: " << prob_00.first << " / " << (1 << prob_00.second) << std::endl;
//     simulator.restore();
//     std::cout << "\nState restored.\n";

//     simulator.measure(0, true, 'Z');
//     simulator.measure(1, false, 'Z');
//     std::pair<int, int> prob_01 = simulator.get_prob();
//     std::cout << "Probability: " << prob_01.first << " / " << (1 << prob_01.second) << std::endl;
//     simulator.restore();
//     std::cout << "\nState restored.\n";

//     simulator.measure(0, false, 'Z');
//     simulator.measure(1, true, 'Z');
//     std::pair<int, int> prob_10 = simulator.get_prob();
//     std::cout << "Probability: " << prob_10.first << " / " << (1 << prob_10.second) << std::endl;
//     simulator.restore();
//     std::cout << "\nState restored.\n";

//     simulator.measure(0, true, 'Z');
//     simulator.measure(1, true, 'Z');
//     std::pair<int, int> prob_11 = simulator.get_prob();
//     std::cout << "Probability: " << prob_11.first << " / " << (1 << prob_11.second) << std::endl;
//     simulator.restore();
//     std::cout << "\nState restored.\n";

//     return 0;
// }
