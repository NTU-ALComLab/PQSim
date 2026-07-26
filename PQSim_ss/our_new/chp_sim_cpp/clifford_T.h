#ifndef CLIFFORD_T_H
#define CLIFFORD_T_H

#include "chp_sim.h"

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <stack>
#include <cmath>
#include <vector>
#include <utility>
#include <unordered_map>
#include <algorithm>
#include <limits.h>


using namespace std;
class Observable {
public:
    Observable(const string& filename, const string& ccx_filename, int numQubits, int numCuts, int numOriginal, int useGrouping)
        : _numQubits(numQubits), _numCuts(numCuts), _numOriginal(numOriginal), _use_grouping(useGrouping), _clifford_simulator(numQubits) {
        _num_delayed_prepare = 0;
        parseObservableMap(filename);
        // parseCircuit(circuit_filename);
        prepare_CCX();
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
    int _use_grouping;

    const string _measure_sequence_T = "IZXXYY";
    const string _prepare_sequence_T = "IZXYYX";
    const vector<vector<int>> _coef_sequence_T = {{1,0,1}, {-1,0,1}, {0,-1,2}, {0,-1,2}, {0,-1,2}, {0,1,2}};
    const vector<string> _measure_sequence_CCX = {
        "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY",
        "IIIIIIIIIIZZZZZZZZZZXXXXXXXXXXXXXXXXYYYYYYYYYYYYYYYYIIIIIIIIIIZZZZZZZZZZXXXXXXXXXXXXXXXXYYYYYYYYYYYYYYYYIIIIIIIIIIIIIIIIZZZZZZZZZZZZZZZZXXXXXXXXXXXXXXXXYYYYYYYYYYYYYYYYIIIIIIIIIIIIIIIIZZZZZZZZZZZZZZZZXXXXXXXXXXXXXXXXYYYYYYYYYYYYYYYY",
        "IZZZZXYYYYIZZZZXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIZZZZXYYYYIZZZZXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYYIIIIZZZZXXXXYYYY"
    };
    const vector<string> _prepare_sequence_CCX = {
        "IIIZZIIIZZIIIZZIIIZZIIZZIIZZIIZZIIZZIIZZIIZZIIZZIIZZZIIZZZIIZZZIIZZZIIZZIIZZIIZZIIZZIIZZIIZZIIZZIIZZIIZZXXXXXXYYXXXXXXYYXXXXXXYYXXXXXXYYXXYYXXYYXXYYXXYYXXYYXXYYXXYYXXYYYYYYXXYYYYYYXXYYYYYYXXYYYYYYXXYYXXYYXXYYXXYYXXYYXXYYXXYYXXYYXXYY",
        "IIZIZIIZIZZIZIZZIZIZXXXXXYXYXXXXXYXYYYYYXYXYYYYYXYXYIIZIZIIZIZZIZIZZIZIZXXXXXYXYXXXXXYXYYYYYXYXYYYYYXYXYIIZZIZIZIIZZIZIZIIZZIZIZIIZZIZIZXXYYXYXYXXYYXYXYYYXXXYXYYYXXXYXYIIZZIZIZIIZZIZIZIIZZIZIZIIZZIZIZYYXXXYXYYYXXXYXYXXYYXYXYXXYYXYXY",
        "IZZZZXYYYYIZZZZXYYYYIXIXZYZYIXIXYZYZIXIXYZYZIXIXZYZYIZZZZXYYYYIZZZZXYYYYIXIXZYZYIXIXYZYZIXIXYZYZIXIXZYZYIXIXZZYYIXIXYYZZIXIXZZYYIXIXYYZZIXIXZYYZIXIXYZZYIXIXYZZYIXIXZYYZIXIXYYZZIXIXZZYYIXIXYYZZIXIXZZYYIXIXYZZYIXIXZYYZIXIXZYYZIXIXYZZY"
    };
    const vector<vector<int>> _coef_sequence_CCX = {
        {2,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-2,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-2,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {2,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-2,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {2,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {2,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-2,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {-1,0,4}, {-1,0,4}, {1,0,4}, {1,0,4}, {-1,0,4}
    };

    ChpSimulator _clifford_simulator;

    void parseObservableMap(const string& filename);
    void parseCircuit(const string& filename);
    void prepare_CCX();
    void prepare_T();
    inline string toCliffordObservable(vector<char>& current_sequence);
    void _iterate_measurement(vector<char>& current_sequence, vector<int>& total_prob, vector<int> coeff);
    void _iterate_group_measurement(vector<char>& current_sequence, vector<int>& total_prob, vector<int> coeff);
    vector<int> _multiply_prob(const vector<int>& prob1, const vector<int>& prob2);
    vector<int> _sum_prob(const vector<int>& prob1, const vector<int>& prob2);

};
#endif