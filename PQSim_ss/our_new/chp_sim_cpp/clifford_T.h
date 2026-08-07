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
        _num_state = vector<int>(3,0);
        for (int i = 0; i < _measure_sequence_CCX[0].size(); i++) {
            string conf = "";
            for (int j = 0; j < _measure_sequence_CCX.size(); j++) {
                conf += _prepare_sequence_CCX[j][i];
                conf += _measure_sequence_CCX[j][i];
            }
            _coef_map[conf] = i;
        }
    }

    void print_maps();
    vector<int> get_output_prob(string& q);
    vector<int> get_output_prob(vector<bool>& q);
    void print_grouping_effect();

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

    // record grouping effect
    vector<int> _num_state;

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
    const int _num_CCX_group = 8;
    unordered_map<string, int> _coef_map;
    const vector<vector<string>> _CCX_grouping = {
        {"III","ZII","IZI","IIX","ZZI","ZIX","IZX","ZZX"},
        {"XII","XZI","XIX","XZX","YII","YZI","YIX","YZX"},
        {"IXI","ZXI","IXX","ZXX","IYI","ZYI","IYX","ZYX"},
        {"IIZ","ZIZ","IZZ","ZZZ","IIY","ZIY","IZY","ZZY"},
        {"XXI","XXX","YYI","YYX","XYI","XYX","YXI","YXX"},
        {"XIZ","XZZ","YIY","YZY","XIY","XZY","YIZ","YZZ"},
        {"IXZ","ZXZ","IYY","ZYY","IXY","ZXY","IYZ","ZYZ"},
        {"XXZ","YYZ","YXY","XYY","YXZ","XYZ","XXY","YYY"}
    };
    const vector<vector<int>> _half_generator = {
        {},
        {1,7},
        {2,7},
        {3,7},
        {1,2},
        {1,3},
        {2,3},
        {1,2,3,7}
    };
    const vector<vector<int>> _half_generator_minus = {
        {},
        {4,5},
        {4,6},
        {4,5},
        {5,6},
        {4,6},
        {4,5},
        {}
    };

    ChpSimulator _clifford_simulator;

    void parseObservableMap(const string& filename);
    void parseCircuit(const string& filename);
    void prepare_CCX();
    void prepare_T();
    inline void toCliffordObservable(string& current_sequence, string& clifford_observable);
    void _iterate_measurement(vector<char>& current_sequence, vector<int>& total_prob, vector<int> coeff);
    void _iterate_group_measurement(vector<int>& total_prob);
    vector<int> _multiply_prob(const vector<int>& prob1, const vector<int>& prob2);
    vector<int> _sum_prob(const vector<int>& prob1, const vector<int>& prob2);

};
#endif