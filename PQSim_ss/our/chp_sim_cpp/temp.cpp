#include <iostream>
#include <vector>
#include <utility>
#include <stdexcept>

#include "chp_sim.h"

class ChpSimulator {
public:
    // Constructor to initialize the table and set pointers to sub-arrays
    ChpSimulator(int num_qubits)
        : _n(num_qubits),
          _x(2 * num_qubits + 1, std::vector<bool>(num_qubits, false)),
          _z(2 * num_qubits + 1, std::vector<bool>(num_qubits, false)),
          _r(2 * num_qubits + 1, false),
          _no_measure_table(2 * num_qubits + 1, std::vector<bool>(2 * num_qubits + 1, false)),
          _no_delayed_prepare_table(2 * num_qubits + 1, std::vector<bool>(2 * num_qubits + 1, false)),
          l(1), 
          n_pow(0),
          l_delayed_prepare(1),
          n_pow_delayed_prepare(0) {
        for (int i = 0; i < num_qubits; ++i) {
            _x[i][i] = true;
            _z[i + num_qubits][i] = true;
        }
        _r[2 * num_qubits] = true;
    }

    // Applies a CNOT gate between two qubits
    void cnot(int control, int target) {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            _r[i] = (_r[i] != (_x[i][control] && _z[i][target] && ((_x[i][target] != _z[i][control]) != true)));
            _x[i][target] = (_x[i][target] !=_x[i][control]);
            _z[i][control] = (_z[i][control] != _z[i][target]);
        }
    }

    // Applies a Hadamard gate to a qubit
    void hadamard(int qubit) {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            _r[i] = (_r[i] != (_x[i][qubit] && _z[i][qubit]));
            // // XOR swap for X and Z
            // _x[i][qubit] = (_x[i][qubit] != _z[i][qubit]);
            // _z[i][qubit] = (_z[i][qubit] != _x[i][qubit]);
            // _x[i][qubit] = (_x[i][qubit] != _z[i][qubit]);
            std::swap(_x[i][qubit], _z[i][qubit]);
        }
    }

    // Applies a phase (S) gate to a qubit
    void phase(int qubit) {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            _r[i] = (_r[i] != (_x[i][qubit] && _z[i][qubit]));
            _z[i][qubit] = (_z[i][qubit] != _x[i][qubit]);
        }
    }

    // Applies an X gate to a qubit
    void x(int qubit) {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            _r[i] = (_r[i] != _z[i][qubit]);
        }
    }

    // Applies a Z gate to a qubit
    void z(int qubit) {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            _r[i] = (_r[i] != _x[i][qubit]);
        }
    }

    // Record the current state of the simulator
    void record() {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            // Try the speedup of copying the whole row at once
            for (int j = 0; j < _n; ++j) {
                _no_measure_table[i][j] = _x[i][j];
                _no_measure_table[i][j + _n] = _z[i][j];
            }
            _no_measure_table[i][2 * _n] = _r[i];
        }
    }

    void record_no_delayed_prepare() {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            for (int j = 0; j < _n; ++j) {
                _no_delayed_prepare_table[i][j] = _x[i][j];
                _no_delayed_prepare_table[i][j + _n] = _z[i][j];
            }
            _no_delayed_prepare_table[i][2 * _n] = _r[i];
        }
    }

    // Restore the last recorded state
    void restore() {
        if (_no_measure_table.empty()) {
            throw std::runtime_error("No recorded state to restore.");
        }
        for (int i = 0; i < 2 * _n + 1; ++i) {
            for (int j = 0; j < _n; ++j) {
                _x[i][j] = _no_measure_table[i][j];
                _z[i][j] = _no_measure_table[i][j + _n];
            }
            _r[i] = _no_measure_table[i][2 * _n];
        }
        l = 1;
        n_pow = 0;
        l_delayed_prepare = 1;
        n_pow_delayed_prepare = 0;
    }

    void restore_no_delayed_prepare() {
        if (_no_delayed_prepare_table.empty()) {
            throw std::runtime_error("No recorded state to restore.");
        }
        for (int i = 0; i < 2 * _n + 1; ++i) {
            for (int j = 0; j < _n; ++j) {
                _x[i][j] = _no_delayed_prepare_table[i][j];
                _z[i][j] = _no_delayed_prepare_table[i][j + _n];
            }
            _r[i] = _no_delayed_prepare_table[i][2 * _n];
        }
        l_delayed_prepare = 1;
        n_pow_delayed_prepare = 0;
    }

    void measure(int qubit, bool desired = false, char basis = 'Z') {
        // std::vector<int> prob(2, 0);
        if (basis == 'X') {
            hadamard(qubit);
        }
        else if (basis == 'Y') {
            phase(qubit);
            z(qubit);
            hadamard(qubit);
        }
        for (int i = 0; i < _n; ++i) {
            if (_x[i+_n][qubit]) {
                std::cout << "Random measurement\n";
                n_pow += 1;
                _measure_rand(qubit, i, desired);
                return;
            }
        }
        std::cout << "Determined measurement\n";
        _measure_determined(qubit, desired);
    }

    std::pair<int, int> get_prob() {
        return std::make_pair(l, n_pow);
    }

    // Print the current state of the simulator
    void printTable() const {
        for (int i = 0; i < 2 * _n + 1; ++i) {
            std::cout << "Row " << i << ": ";
            for (int j = 0; j < _n; ++j) {
                std::cout << _x[i][j] << " ";
            }
            for (int j = 0; j < _n; ++j) {
                std::cout << _z[i][j] << " ";
            }
            std::cout << _r[i] << std::endl;
        }
    }

private:
    int _n;  // Number of qubits
    // std::vector<std::vector<bool>> _table;  // The main stabilizer table
    std::vector<std::vector<bool> > _x;
    std::vector<std::vector<bool> > _z;
    std::vector<bool> _r;
    std::vector<std::vector<bool> > _no_measure_table;  // Backup table for restoration
    std::vector<std::vector<bool> > _no_delayed_prepare_table;  // Backup table for delayed preparation

    // For measurement prob  = l / 2^n
    int l;
    int n_pow; 
    int l_delayed_prepare;
    int n_pow_delayed_prepare;

    void _measure_rand(int qubit, int p, bool desired) {
        _x[p] = _x[p + _n];
        _z[p] = _z[p + _n];
        _x[p + _n] = std::vector<bool>(_n, false);
        _z[p + _n] = std::vector<bool>(_n, false);
        _z[p + _n][qubit] = true;
        _r[p + _n] = desired;

        for (int i = 0; i < 2 * _n; ++i) {
            if (_x[i][qubit] && i != p && i != p + _n) {
                _row_mult(i, p);
            }
        }

    }

    void _measure_determined(int qubit, bool desired) {
        _x[_x.size()-1] = std::vector<bool>(_n, false);
        _z[_z.size()-1] = std::vector<bool>(_n, false);
        _r[_r.size()-1] = false;
        for (int i = 0; i < _n; ++i) {
            if (_x[i][qubit]) {
                _row_mult(_x.size() - 1, i + _n);
            }
        }
        if (_r[_r.size()-1] != desired) {
            l = 0;
        }
    }

    void _row_mult(int i, int j) {
        _r[i] = _row_product_sign(i, j);
        for (int k = 0; k < _n; ++k) {
            _x[i][k] = _x[i][k] != _x[j][k];
            _z[i][k] = _z[i][k] != _z[j][k];
        }
    }

    bool _row_product_sign(int i, int j) {
        int pauli_phases = 0;
        for (int k = 0; k < _n; ++k) {
            pauli_phases += _pauli_product_phase(_x[i][k], _z[i][k], _x[j][k], _z[j][k]);
        }
        pauli_phases = pauli_phases >> 1;
        bool p = pauli_phases % 2;
        return (_r[i] != (_r[j] != p));
    }

    int _pauli_product_phase(bool x1, bool z1, bool x2, bool z2) {
        /*Determines the power of i in the product of two Paulis.

        For example, X*Y = iZ and so this method would return +1 for X and Y.

        The input Paulis are encoded into the following form:

            x z | Pauli
            ----+-------
            0 0 | I
            1 0 | X
            1 1 | Y
            0 1 | Z
        */
        if (x1 && z1) {
            return (x2 == z2) ? 0 : (x2 ? -1 : 1);
        }

        if (x1) {
            return z2 ? (x2 ? 1 : -1) : 0;
        }

        if (z1) {
            return x2 ? (z2 ? -1 : 1) : 0;
        }

        return 0;
    }

};

int main() {
    // Example usage
    int num_qubits = 2;
    ChpSimulator simulator(num_qubits);

    std::cout << "Initial table:\n";
    simulator.printTable();

    simulator.hadamard(0);
    std::cout << "\nAfter applying Hadamard gate:\n";
    simulator.printTable();

    simulator.cnot(0, 1);
    std::cout << "\nAfter applying CNOT gate:\n";
    simulator.printTable();

    // simulator.phase(1);
    // std::cout << "\nAfter applying Phase gate:\n";
    // simulator.printTable();

    simulator.record();
    std::cout << "\nState recorded.\n";

    simulator.measure(0, false, 'Z');
    std::pair<int, int> prob_0 = simulator.get_prob();
    std::cout << "Probability: " << prob_0.first << " / " << (1 << prob_0.second) << std::endl;
    simulator.printTable();
    simulator.measure(1, false, 'Z');
    std::pair<int, int> prob_00 = simulator.get_prob();
    std::cout << "Probability: " << prob_00.first << " / " << (1 << prob_00.second) << std::endl;
    simulator.restore();
    std::cout << "\nState restored.\n";

    simulator.measure(0, true, 'Z');
    simulator.measure(1, false, 'Z');
    std::pair<int, int> prob_01 = simulator.get_prob();
    std::cout << "Probability: " << prob_01.first << " / " << (1 << prob_01.second) << std::endl;
    simulator.restore();
    std::cout << "\nState restored.\n";

    simulator.measure(0, false, 'Z');
    simulator.measure(1, true, 'Z');
    std::pair<int, int> prob_10 = simulator.get_prob();
    std::cout << "Probability: " << prob_10.first << " / " << (1 << prob_10.second) << std::endl;
    simulator.restore();
    std::cout << "\nState restored.\n";

    simulator.measure(0, true, 'Z');
    simulator.measure(1, true, 'Z');
    std::pair<int, int> prob_11 = simulator.get_prob();
    std::cout << "Probability: " << prob_11.first << " / " << (1 << prob_11.second) << std::endl;
    simulator.restore();
    std::cout << "\nState restored.\n";

    return 0;
}
