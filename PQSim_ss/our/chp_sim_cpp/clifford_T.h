#ifndef CLIFFORD_T_H
#define CLIFFORD_T_H

#include "chp_sim.h"

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <stack>
#include <vector>
#include <utility>
#include <unordered_map>
#include <algorithm>
#include <limits.h>


using namespace std;
class Observable {
public:
    Observable(const string& filename, const string& ccx_filename, int numQubits, int numCuts, int numOriginal) 
        : _numQubits(numQubits), _numCuts(numCuts), _numOriginal(numOriginal), _clifford_simulator(numQubits), _measure_sequence("IIXXYYZZ"), _prepare_sequence("01+-ij01") {
        _num_delayed_prepare = 0;
        parseObservableMap(filename);
        // parseCircuit(circuit_filename);
        load_CXX(ccx_filename);
        prepare_T();
        _num_obs = 0;
    }

    void print_maps();
    vector<int> get_output_prob(string& q);
    vector<int> get_output_prob(vector<bool>& q);

private:
    unordered_map<std::string, vector<int> > _CCX_table;
    unordered_map<std::string, vector<int> > _T_table;
    vector<pair<string, int> > _Clifford_map;
    vector<pair<string, int> > _T_map;
    vector<pair<string, int> > _CCX_map;
    // 'C' for Clifford, 'T' for T, 'X' for CCX // remember to /2 for T gate, /6 for CCX gate
    vector<pair<char, int> > _input_map;
    vector<pair<char, int> > _output_map;
    vector<pair<char, int> > _original_map;
    int _numQubits;
    int _numCuts;
    int _numOriginal;
    int _num_obs;
    int _num_delayed_prepare;
    string _measure_sequence;
    string _prepare_sequence;

    ChpSimulator _clifford_simulator;

    void parseObservableMap(const string& filename);
    void parseCircuit(const string& filename);
    void load_CXX(const std::string& filename);
    void prepare_T();
    void _iterate_measurement(vector<char>& current_sequence, string& q, vector<int>& total_prob, int coeff);
    void _iterate_measurement(vector<char>& current_sequence, vector<bool>& q, vector<int>& total_prob, int coeff);
    vector<int> _multiply_prob(vector<int>& prob1, vector<int>& prob2);
    vector<int> _sum_prob(vector<int>& prob1, vector<int>& prob2);

};
#endif