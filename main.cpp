#include <iostream>
#include <queue>
#include <utility>
#include <random>
#include <cmath>
#include <string>
#include <vector>
#include <map>
#include <chrono>
#include <gmpxx.h>

#include "SimpleSerial.h"
// #include <pybind11/embed.h>  // Pybind11 for embedding Python

using namespace std;

mpf_class calc_prob_of_zero(mpz_class a_prev, mpz_class b_prev, mpz_class n_prev, mpz_class a, mpz_class b, mpz_class n) {// undicide
    //int c = 2^n
    mpf_class two = 2;
    mpz_class n_diff_mpz = n - n_prev;
    unsigned int n_diff = n_diff_mpz.get_ui();
    string powStr(n_diff, '0');
    powStr = "1" + powStr;
    mpz_class pow_diff;
    pow_diff.set_str(powStr, 2);
    mpf_class sqrt_2 = sqrt(two);
    mpf_class num1, num2;
    num1 = a + b * sqrt_2;
    num2 = pow_diff * (a_prev + b_prev * sqrt_2);
    num1 = num1 / num2;
    return num1;
}
// namespace py = pybind11;
class TreeNode{
private:
    TreeNode* zero_child;
    TreeNode* one_child;
    mpz_class prob_of_zero_a;
    mpz_class prob_of_zero_b;
    mpz_class n;
    mpz_class prob_of_prev_a;
    mpz_class prob_of_prev_b;
    mpz_class prev_n; // Currently, n is equal for all nodes
    mpf_class prob_of_zero;
public:
    // TreeNode(TreeNode* prev, TreeNode* zero, TreeNode* one, int prob_a, int prob_b, int n): zero_child(zero), one_child(one), prob_of_zero_a(prob_a), prob_of_zero_b(prob_b), n(n) {
    //     prob_of_zero = calc_prob_of_zero(prev->prob_of_zero_a, prev->prob_of_zero_b, prev->n, prob_of_zero_a, prob_of_zero_b, n);
    // }
    // TreeNode(TreeNode* prev, int prob_a, int prob_b, int n): prob_of_zero_a(prob_a), prob_of_zero_b(prob_b), n(n) {
    //     zero_child = new TreeNode();
    //     one_child = new TreeNode();
    //     prob_of_zero = calc_prob_of_zero(prev->prob_of_zero_a, prev->prob_of_zero_b, prev->n, prob_of_zero_a, prob_of_zero_b, n);
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
    vector<mpz_class> get_prob_of_prev() {
        vector<mpz_class> ans{prob_of_prev_a, prob_of_prev_b, prev_n};
        return ans;
    }
    mpz_class get_prob_of_zero_a() {
        return prob_of_zero_a;
    }
    // double get_prob_of_zero_double() {
    //     return prob_of_zero;
    // }
    TreeNode* get_child_by_prob(vector<bool>& q, mt19937& gen){
        // sample from the distribution with prob_of_zero
        if (prob_of_zero_a == -1) {
            return nullptr;
        }
        bernoulli_distribution distribution(prob_of_zero.get_d());
        bool output = !(distribution(gen));
        q.push_back(output);
        if (output) {
            return one_child;
        }
        return zero_child;
    }
    void set_prob_of_zero(mpz_class _prev_a, mpz_class _prev_b, mpz_class _prev_n, mpz_class _a, mpz_class _b, mpz_class _n) {
        prob_of_zero_a = _a;
        prob_of_zero_b = _b;
        n = _n;
        prob_of_zero = calc_prob_of_zero(_prev_a, _prev_b, _prev_n, _a, _b, _n);
        zero_child = new TreeNode();
        zero_child->set_prob_of_prev(_a, _b, _n);
        one_child = new TreeNode();
        if (_n == _prev_n){
            one_child->set_prob_of_prev(_prev_a - _a, _prev_b - _b, _n);
        }
        else if(_n > _prev_n){
            mpz_class n_diff_mpz = _n - _prev_n;
            unsigned int n_diff = n_diff_mpz.get_ui();
            string powStr(n_diff, '0');
            powStr = "1" + powStr;
            mpz_class pow_diff;
            pow_diff.set_str(powStr, 2);
            one_child->set_prob_of_prev(_prev_a * pow_diff - _a, _prev_b * pow_diff - _b, _n);
        }
        else {
            mpz_class n_diff_mpz = _prev_n - _n;
            unsigned int n_diff = n_diff_mpz.get_ui();
            string powStr(n_diff, '0');
            powStr = "1" + powStr;
            mpz_class pow_diff;
            pow_diff.set_str(powStr, 2);
            one_child->set_prob_of_prev(_prev_a - _a * pow_diff, _prev_b - _b * pow_diff, _prev_n);
        }
    }
    void set_prob_of_prev(mpz_class _prev_a, mpz_class _prev_b, mpz_class _prev_n){
        prob_of_prev_a = _prev_a;
        prob_of_prev_b = _prev_b;
        prev_n = _prev_n;
    }
    //void set_zero_child(TreeNode* zero) {
    //    zero_child = zero;
    //}
    //void set_one_child(TreeNode* one) {
    //    one_child = one;
    //}
};
pair<TreeNode*, TreeNode*> generate_query(const int n, vector<bool>& q, TreeNode* prev_node, TreeNode* current_node, mt19937& gen) {
    while(current_node && (current_node->get_prob_of_zero_a()!=-1) && q.size() < n) {
        prev_node = current_node;
        current_node = current_node->get_child_by_prob(q, gen);
    }
    return make_pair(prev_node, current_node);
}

// void print_sample(vector<bool>& q) {
//     for(auto i: q) {
//         cout << i << " ";
//     }
//     cout << endl;
// }

string bitStringToString(string bitStr, int length){
  // fill 0 until the size is multiples of 8
  while (bitStr.size() != 8 * length){
	bitStr = "0" + bitStr;
  }
  string tmp, s;
  for (int i = 0;i < length;i++){
    tmp = bitStr.substr(8*i, 8);
    int char_v = 0;
    for (int j = 0;j < 8;j++)
    {
      if (tmp[j] == '1'){
        char_v += (1 << (7-j));
      }
    }
    // cout << char_v << endl;
    s += (char)char_v;
  }
  return s;
}

string stringToBitString(string str){
  int tmp;
  string bs, tmp_s;
  for(int i = 0;i<str.size();i++){
    tmp = (int)str[i];
    if (tmp < 0) tmp += 256;
    // cout << tmp << endl;
    tmp_s = "";
    for (int j = 0;j < 8;j++)
    {
      if (tmp == 0){
        tmp_s = "0" + tmp_s;
        continue;
      }

      if (tmp%2 == 1){
        tmp_s = "1" + tmp_s;
      }
      else{
        tmp_s = "0" + tmp_s;
      }
      tmp = tmp/2;
    }
    bs += tmp_s;
  }
  return bs;
}

mpz_class bitStringToInt(string bitStr){
	mpz_class result;
	// int flag = (1 << (bitStr.size() - 1)) - 1;
	if (bitStr[0] == '1') {
        result.set_str(bitStr, 2);
        unsigned int str_size = bitStr.size();
        string powStr(str_size, '0');
        powStr = "1" + powStr;
        mpz_class pow_2;
        pow_2.set_str(powStr, 2);
        result = result - pow_2;
	}
	else{
		result.set_str(bitStr, 2);
	}
	return result;
}

vector<mpz_class> get_circuit_prob(vector<bool>& q, int n, mpz_class n_exp, SimpleSerial& serial) {
    // generate input bit string
	string inputBitString = "";
    string observable = "";
	for (int i = 0 ; i < n ; i++){
		if (i > q.size()){
			inputBitString = "0000" + inputBitString;
            observable = "I" + observable;
		}
        else if (i == q.size()){
            inputBitString = "1001" + inputBitString;
            observable = "0" + observable;
        }
		else{
			if (q[i]){
				inputBitString = "1101" + inputBitString;
                observable = "1" + observable;
			}
			else{
				inputBitString = "1001" + inputBitString;
                observable = "0" + observable;
			}
		}
	}
	// Communicate with serial
	string inputString, outputString;
	string outputBitString;
	string resultString;

    int inputLength = n/2 + n%2;

	inputString = bitStringToString(inputBitString, inputLength);
	string inputStringRev(inputString.rbegin(), inputString.rend());
	serial.writeString(inputStringRev);

	int outputLength = 8; // User defined
	outputString = serial.readString(outputLength);
	string outputStringRev(outputString.rbegin(), outputString.rend());
	resultString = stringToBitString(outputStringRev);
    // cout << resultString << endl;

	// Calculate a, b
	mpz_class k, a, b;
	vector<mpz_class> result;
    k = bitStringToInt(resultString.substr(0, 16));
	a = bitStringToInt(resultString.substr(16, 24));
	b = bitStringToInt(resultString.substr(40, 24));
    k = k + n_exp;
	result.push_back(a);
	result.push_back(b);
	result.push_back(k);
    // cout << observable;
    // gmp_printf(" : %Zd %Zd %Zd\n", a, b, k);
    return result;
}

vector<mpz_class> get_obs_value(string obs, mpz_class n_exp, SimpleSerial& serial) {
    // generate input bit string
	string inputBitString = "";
	for (int i = 0 ; i < obs.size() ; i++){
		switch(obs[i])
        {
            case 'I':
                inputBitString += "0000";
                break;
            case 'X':
                inputBitString += "0010";
                break;
            case 'Y':
                inputBitString += "0011";
                break;
            case 'Z':
                inputBitString += "0001";
                break;
            case '0':
                inputBitString += "1001";
                break;
            case '1':
                inputBitString += "1101";
                break;
            case '+':
                break;
            case '-':
                break;
            case 'i':
                break;
            case 'j':
                break;
            default:
                break;
        }
	}
	// Communicate with serial
	string inputString, outputString;
	string outputBitString;
	string resultString;

    int inputLength = obs.size()/2 + obs.size()%2;

	inputString = bitStringToString(inputBitString, inputLength);
	string inputStringRev(inputString.rbegin(), inputString.rend());
	serial.writeString(inputStringRev);

	int outputLength = 8; // User defined
	outputString = serial.readString(outputLength);
	string outputStringRev(outputString.rbegin(), outputString.rend());
	resultString = stringToBitString(outputStringRev);
    // cout << resultString << endl;

	// Calculate a, b
	mpz_class k, a, b;
	vector<mpz_class> result;
    k = bitStringToInt(resultString.substr(0, 16));
	a = bitStringToInt(resultString.substr(16, 24));
	b = bitStringToInt(resultString.substr(40, 24));
    k = k + n_exp;
	result.push_back(a);
	result.push_back(b);
	result.push_back(k);
    // cout << inputBitString;
    gmp_printf("a = %Zd, b = %Zd, k = %Zd\n", a, b, k);
    return result;
}

int main(int argc, char* argv[]) {
    // Create a random device and a generator
    std::random_device rd;
    std::mt19937 gen(rd());
	// Connect to serial
	SimpleSerial serial(argv[1], 115200);
    string mode = argv[2];
    if (mode == "-s")
    {
        std::map<std::string, int> count;
        // prob = a(int) + b(int)sqrt(2) / (some int)
        const int total_shot = stoi(argv[3]);
        mpz_class n_exp = stoi(argv[4]);
        const int n = stoi(argv[5]);
        const int n_measure = stoi(argv[6]);
        // Time
        chrono::steady_clock::time_point begin, end;
        chrono::steady_clock::time_point begin_x, end_x;
        int queryTime = 1;

        begin = chrono::steady_clock::now();
        TreeNode* root = new TreeNode();
        for(int i=0; i<total_shot; i++){
            TreeNode* current_node = root;
            TreeNode* prev = nullptr;
            vector<bool> q;
            while(q.size() < n_measure){
                pair<TreeNode*, TreeNode*> p = generate_query(n_measure, q, prev, current_node, gen);
                prev = p.first;
                current_node = p.second;

                if(q.size() == n_measure){
                    // print_sample(q);
                    string sampleString = "";
                    for (bool x : q){
                        if (x){
                            sampleString = '1' + sampleString;
                        }
                        else{
                            sampleString = '0' + sampleString;
                        }
                    }
                    if (count.find(sampleString) != count.end()){
                        count[sampleString] += 1;
                    }
                    else{
                        count[sampleString] = 1;
                    }
                    break;
                }
                //cout << "Query " << queryTime << " at shot " << i << endl;
                queryTime++;
                //begin_x = chrono::steady_clock::now();
                vector<mpz_class> prob = get_circuit_prob(q, n, n_exp, serial);
                //end_x = chrono::steady_clock::now();

                //cout << "Query time : " << chrono::duration_cast<std::chrono::microseconds>(end_x - begin_x).count()/1000000.0 << " s" << endl;
                //cout << endl;
                // if(prev){
                //     cout<<calc_prob_of_zero(prev->get_prob_of_zero_int().first.first, prev->get_prob_of_zero_int().first.second, prev->get_prob_of_zero_int().second, prob.first.first, prob.first.second, prob.second)<<endl;
                // }
                // else{
                //     cout<<calc_prob_of_zero(1, 0, 0, prob.first.first, prob.first.second, prob.second)<<endl;
                // }
                if(current_node->get_prob_of_zero_a() == -1){
                    if(prev){// Not root
                        vector<mpz_class> prev = current_node->get_prob_of_prev();
                        current_node->set_prob_of_zero(prev[0], prev[1], prev[2], prob[0], prob[1], prob[2]);
                    }
                    else{
                        mpz_class numZero = 0;
                        mpz_class numOne = 1;
                        current_node->set_prob_of_zero(numOne, numZero, numZero, prob[0], prob[1], prob[2]);
                    }
                }
            }
        }
        end = chrono::steady_clock::now();
        for( auto it = count.begin(); it != count.end(); ++it )
        {
        string sampleString = it->first;
        int sampleCount = it->second;
        cout << sampleString << " : " << sampleCount << endl;
        }
        cout << "Sample time : " << chrono::duration_cast<std::chrono::microseconds>(end - begin).count()/1000000.0 << " s" << endl;
    }
    else if (mode == "-q")
    {
        string obs = argv[3];
        mpz_class n_exp = stoi(argv[4]);
        const int n = stoi(argv[5]);
        if (obs.size() != n)
        {
            cout << "Observable length not match" << endl;
            return 0;
        }
        cout << "Observable : " << obs << endl;
        chrono::steady_clock::time_point begin, end;
        begin = chrono::steady_clock::now();

        vector<mpz_class> prob = get_obs_value(obs, n_exp, serial);
        mpf_class two = 2;
        unsigned int n_exp_2 = prob[2].get_ui();
        string powStr(n_exp_2, '0');
        powStr = "1" + powStr;
        mpz_class pow_2;
        pow_2.set_str(powStr, 2);
        mpf_class sqrt_2 = sqrt(two);
        mpf_class num;
        num = prob[0] + prob[1] * sqrt_2;
        num = num / pow_2;
        gmp_printf("Expectation value : %Ff\n", num);

        end = chrono::steady_clock::now();
        cout << "Query time : " << chrono::duration_cast<std::chrono::microseconds>(end - begin).count()/1000000.0 << " s" << endl;
    }
    else
    {
        cout << "Mode not exist" << endl;
    }
    return 0;
}
