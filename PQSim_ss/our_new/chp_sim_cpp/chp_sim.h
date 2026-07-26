#ifndef CHPSIMULATOR_H
#define CHPSIMULATOR_H

#include <vector>
#include <iostream>
#include <utility>
#include <string>
#include <cassert>
#include <vector>
#include <fstream>
#include <sstream>
#include <unordered_map>
#include <algorithm>
#include <limits.h>

class ChpSimulator {
public:
    // Constructor to initialize the table and set pointers to sub-arrays
    ChpSimulator(int num_qubits);

    // Applies a CNOT gate between two qubits
    void cnot(int control, int target);

    // Applies a Hadamard gate to a qubit
    void hadamard(int qubit);

    // Applies a phase (S) gate to a qubit
    void phase(int qubit);

    // Applies an X gate to a qubit
    void x(int qubit);

    // Applies a Y gate to a qubit
    void y(int qubit);

    // Applies a Z gate to a qubit
    void z(int qubit);

    // Record the current state of the simulator
    void record();

    void record_no_delayed_prepare();

    // Restore the last recorded state
    void restore();

    void restore_no_delayed_prepare();

    void measure(std::string observable);

    std::pair<int, int> get_prob();

    // Print the current state of the simulator
    void printTable() const;
    void read_tableau(const std::string& filename);

private:
    int _n;  // Number of qubits
    std::vector<std::vector<bool> > _tableau;
    std::vector<std::vector<bool> > _no_measure_table;  // Backup table for restoration
    std::vector<std::vector<bool> > _no_delayed_prepare_table;  // Backup table for delayed preparation

    // For measurement prob  = l / 2^n
    int l;
    int n_pow; 
    int l_delayed_prepare;
    int n_pow_delayed_prepare;

    std::vector<bool> _observable_to_tableau(std::string& observable);
    bool _is_commute(std::vector<bool>& row1, std::vector<bool>& row2);
    std::vector<bool> _row_sum(std::vector<bool>& row1, std::vector<bool>& row2);


};

#endif // CHPSIMULATOR_H
