#include "chp_sim_cpp/chp_sim.h"
#include "chp_sim_cpp/clifford_T.h"

#include <iostream>
#include <queue>
#include <utility>
#include <random>
#include <cmath>
#include <ctime>
#include <unordered_map>
#include <algorithm>
#include <limits.h>
// #include <pybind11/embed.h>  // Pybind11 for embedding Python
using namespace std;
unordered_map<string, int> profile;
double calc_prob_of_zero(int a_prev, int b_prev, int n_prev, int a, int b, int n) {// undicide
    //int c = 2^n
    int c = 1<<(n-n_prev);
    return (a + b * sqrt(2)) / (c * (a_prev + b_prev * sqrt(2)));
}
// namespace py = pybind11;
class TreeNode{
private:
    TreeNode* zero_child;
    TreeNode* one_child;
    int prob_of_zero_a;
    int prob_of_zero_b;
    int n;
    int prob_of_prev_a;
    int prob_of_prev_b;
    int prev_n; // Currently, n is equal for all nodes
    double prob_of_zero;
public:
    // TreeNode(TreeNode* prev, TreeNode* zero, TreeNode* one, int prob_a, int prob_b, int n, bool prev_sign): zero_child(zero), one_child(one), prob_of_zero_a(prob_a), prob_of_zero_b(prob_b), n(n) {
    //     prob_of_zero = calc_prob_of_zero(prev->prob_of_zero_a, prev->prob_of_zero_b, prev->n, prev_sign, prob_of_zero_a, prob_of_zero_b, n);
    // }
    // TreeNode(TreeNode* prev, int prob_a, int prob_b, int n, bool prev_sign): prob_of_zero_a(prob_a), prob_of_zero_b(prob_b), n(n) {
    //     zero_child = new TreeNode();
    //     one_child = new TreeNode();
    //     prob_of_zero = calc_prob_of_zero(prev->prob_of_zero_a, prev->prob_of_zero_b, prev->n, prev_sign, prob_of_zero_a, prob_of_zero_b, n);
    // }
    TreeNode(){
        zero_child = nullptr;
        one_child = nullptr;
        prob_of_zero_a = -1;
        prob_of_zero_b = -1;
        prob_of_zero = -1;
        n = -1;
    }
    // TreeNode* get_zero_child() {
    //     return zero_child;
    // }
    // TreeNode* get_one_child() {
    //     return one_child;
    // }
    vector<int> get_prob_of_prev() {
        vector<int> ans{prob_of_prev_a, prob_of_prev_b, prev_n};
        return ans;
    }
    vector<int> get_prob_of_zero_int() {
        vector<int> ans{prob_of_zero_a, prob_of_zero_b, n};
        return ans;
    }
    int get_prob_of_zero_a() {
        return prob_of_zero_a;
    }
    double get_prob_of_zero_double() {
        return prob_of_zero;
    }
    TreeNode* get_child_by_prob(vector<bool>& q, mt19937& gen){
        // sample from the distribution with prob_of_zero
        if (prob_of_zero_a == -1) {
            return nullptr;
        }
        bernoulli_distribution distribution(prob_of_zero);
        bool output = !(distribution(gen));
        q.push_back(output);
        if (output) {
            return one_child;
        }
        return zero_child;

    }
    void set_prob_of_zero(int a_prev, int b_prev, int n_prev, int a, int b, int n_) {
        prob_of_zero_a = a;
        prob_of_zero_b = b;
        n = n_;
        prob_of_zero = calc_prob_of_zero(a_prev, b_prev, n_prev, a, b, n);
        zero_child = new TreeNode();
        zero_child->set_prob_of_prev(a, b, n);
        one_child = new TreeNode();
        if (n == n_prev){
            one_child->set_prob_of_prev(a_prev - a, b_prev - b, n);
        }
        else if(n > n_prev){
            int n_diff = n - n_prev;
            one_child->set_prob_of_prev(a_prev * (1<<n_diff) - a, b_prev * (1<<n_diff) - b, n);
        }
        else {
            int n_diff = n_prev - n;
            one_child->set_prob_of_prev(a_prev - a * (1<<n_diff), b_prev - b * (1<<n_diff), n_prev);
        }
    }
    void set_prob_of_prev(int _prev_a, int _prev_b, int _prev_n){
        prob_of_prev_a = _prev_a;
        prob_of_prev_b = _prev_b;
        prev_n = _prev_n;
    }
    // void set_zero_child(TreeNode* zero) {
    //     zero_child = zero;
    // }

    // void set_one_child(TreeNode* one) {
    //     one_child = one;
    // }

};
pair<TreeNode*, TreeNode*> generate_query(const int n, vector<bool>& q, TreeNode* prev_node, TreeNode* current_node, mt19937& gen) {
    while(current_node && (current_node->get_prob_of_zero_a()!=-1) && q.size() < n) {
        prev_node = current_node;
        current_node = current_node->get_child_by_prob(q, gen);
    }
    // if (q.size() == n) {
    //     for (int i=0; i<q.size(); i++) {
    //         cout << q[i];
    //     }
    //     cout << endl;
    //     vector<int> prob = current_node->get_prob_of_zero_int();
    //     cout << "PROBABILITY: " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
    // }
    return make_pair(prev_node, current_node);
}

void print_sample(vector<bool>& q) {
    //cout << "Sample: ";
    //for(auto i: q) {
    //    cout << i; // << " ";
    //}
    //cout << endl;
    //turn the sample into a string and store it in the profile
    string sample = "";
    for(auto i: q) {
        sample += to_string(i);
    }
    if(profile.find(sample) == profile.end()) {
        profile[sample] = 1;
    } else {
        profile[sample]++;
    }
}

void print_profile(int total_shot) {
    // // sort the profile
    // vector<pair<string, int>> profile_vec;
    // for(auto i: profile) {
    //     profile_vec.push_back(i);
    // }
    // sort(profile_vec.begin(), profile_vec.end(), [](pair<string, int> a, pair<string, int> b) {
    //     string a_reversed = a.first;
    //     string b_reversed = b.first;
    //     reverse(a_reversed.begin(), a_reversed.end());
    //     reverse(b_reversed.begin(), b_reversed.end());
    //     return stoi(a_reversed) > stoi(b_reversed);
    // });
    // // print the profile
    // for(auto i: profile_vec) {
    //     cout << i.first << " " << (double)i.second / total_shot << endl;
    // }
    for(auto i: profile) {
        cout << i.first << " " << (double)i.second / total_shot << endl;
    }
}

vector<int> get_circuit_prob(vector<bool>& q) {// fake function
    vector<int> ans{1, 0, 1};
    return ans;
}
void query_mode(string filename, int n_origin, int n_after, int n_cuts, string query, int use_grouping) {
    string ccx_filename = "Toffoli.csv";
    Observable obs(filename, ccx_filename, n_after, n_cuts, n_origin, use_grouping);

    // obs.print_maps();
    // string q = "IIIII";cd SS_O
    // vector<bool> q(10, false);
    // q[0] = true;
    // q[1] = true;
    // q[2] = true;
    // q[3] = true;
    // q[4] = true;
    // timing
    clock_t start,end;
    start = clock();
    vector<int> prob = obs.get_output_prob(query);
    end = clock();
    cout << "Time: " << (double)(end - start) / CLOCKS_PER_SEC << "s" << endl;
    std::cout << "Probability of " << query << " : " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
    // q[0] = true;
    // prob = obs.get_output_prob(q);
    // std::cout << "Probability: " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
    // q[1] = true;
    // prob = obs.get_output_prob(q);
    // std::cout << "Probability: " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
    // return 0;
}
void sample_mode(string filename, int n_origin, int n_after, int n_cuts, int total_shot, int use_grouping) {
    // Create a random device and a generator
    std::random_device rd;
    std::mt19937 gen(rd());
// prob = a(int) + b(int)sqrt(2) / (some int)
    string ccx_filename = "Toffoli.csv";
    Observable obs(filename, ccx_filename, n_after, n_cuts, n_origin, use_grouping);

    clock_t start,end;

    TreeNode* root = new TreeNode();
    start = clock();
    for(int i=0; i<total_shot; i++){
        TreeNode* current_node = root;
        TreeNode* prev = nullptr;
        vector<bool> q;
        while(q.size() < n_origin){
            pair<TreeNode*, TreeNode*> p = generate_query(n_origin, q, prev, current_node, gen);
            prev = p.first;
            current_node = p.second;

            if(q.size() == n_origin){
                print_sample(q);
                break;
            }
            q.push_back(false);
            // cout<<q.size()<<endl;
            // cout << "Observable : ";
            // for(int j=0; j<q.size(); j++){
            //     cout<<q[j];
            // }
            // for(int j=0; j<n_origin-q.size(); j++){
            //     cout<<'I';
            // }
            // std::cout << std::endl;
            vector<int> prob = obs.get_output_prob(q);
            ///////
            // for(int j=0; j<q.size(); j++){
            //     cout<<q[j];
            // }
            // std::cout << std::endl;
            // std::cout << "Probability: " << prob[0] << " + " << prob[1] << "i + " << prob[2] << "j" << endl;
            ///////
            q.pop_back();
            // if(prev){
            //     cout<<calc_prob_of_zero(prev->get_prob_of_zero_int().first.first, prev->get_prob_of_zero_int().first.second, prev->get_prob_of_zero_int().second, prob.first.first, prob.first.second, prob.second)<<endl;
            // }
            // else{
            //     cout<<calc_prob_of_zero(1, 0, 0, prob.first.first, prob.first.second, prob.second)<<endl;
            // }
            if(current_node->get_prob_of_zero_a() == -1){
                if(prev){
                    vector<int> prev_prob = current_node->get_prob_of_prev();
                    current_node->set_prob_of_zero(prev_prob[0], prev_prob[1], prev_prob[2], prob[0], prob[1], prob[2]);
                } else {
                    current_node->set_prob_of_zero(1, 0, 0, prob[0], prob[1], prob[2]);
                }
            }


        }


    }
    end = clock();
    cout << "Time: " << (double)(end - start) / CLOCKS_PER_SEC << "s" << endl;
    print_profile(total_shot);
    if (use_grouping) obs.print_grouping_effect();
    // return 0;
}

int main(int argc, char* argv[]){
    if (argc != 7 && argc != 8) {
        std::cerr << "Usage: " << argv[0] << " <MODE> <PAULI OR SHOTS> <N_ORIGIN> <N_AFTER> <N_CUTS> <OBSERVABLE_MAP_FILE> <USE_GROUPING>" << std::endl;
        return 1;
    }

    std::string mode = argv[1];
    std::string pauli_or_shots = argv[2];
    int n_origin = std::stoi(argv[3]);
    int n_after = std::stoi(argv[4]);
    int n_cuts = std::stoi(argv[5]);
    std::string observable_file = argv[6];
    int use_grouping = 0;
    if (argc != 7) use_grouping = std::stoi(argv[7]);

    // print the arguments
    /*
    std::cout << "Mode: " << mode << std::endl;
    std::cout << "Pauli or Shots: " << pauli_or_shots << std::endl;
    std::cout << "N_Origin: " << n_origin << std::endl;
    std::cout << "N_After: " << n_after << std::endl;
    std::cout << "N_Cuts: " << n_cuts << std::endl;
    std::cout << "Observable Map File: " << observable_file << std::endl;
    */

    if(mode == "query") {
        query_mode(observable_file, n_origin, n_after, n_cuts, pauli_or_shots, use_grouping);
    } else if(mode == "sample") {
        sample_mode(observable_file, n_origin, n_after, n_cuts, std::stoi(pauli_or_shots), use_grouping);
    } else {
        std::cerr << "Invalid mode: " << mode << std::endl;
        return 1;
    }

    return 0;
}
