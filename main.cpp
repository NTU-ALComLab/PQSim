#include <iostream>
#include <utility>
#include <random>
#include <cmath>
#include <string>
#include <vector>
#include <map>
#include <chrono> // Measure time
#include <gmpxx.h> // For larger number operations

#include "SimpleSerial.h" // For UART communications

using namespace std;

// Calculate the branching probability
// Equal to ((a + b * sqrt(2)) / 2 ^ n) / ((a_prev + b_prev * sqrt(2)) / 2 ^ n_prev)
// = (a + b * sqrt(2)) / ((a_prev + b_prev * sqrt(2)) / 2 ^ (n - n_prev))
mpf_class calc_prob_of_zero(mpz_class a_prev, mpz_class b_prev, mpz_class n_prev, mpz_class a, mpz_class b, mpz_class n)
{
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

// TreeNode class
class TreeNode
{
private:
    TreeNode* zero_child; // 0 branch
    TreeNode* one_child; // 1 branch

    // probability of node
    mpz_class prob_of_curr_a;
    mpz_class prob_of_curr_b;
    mpz_class curr_n;

    // probability of parent node
    mpz_class prob_of_prev_a;
    mpz_class prob_of_prev_b;
    mpz_class prev_n;

    mpf_class prob_of_zero; // probability of going to 0 branch

public:
    TreeNode()
    {
        zero_child = nullptr;
        one_child = nullptr;
        prob_of_curr_a = -1;
        prob_of_curr_b = -1;
        curr_n = -1;
        prob_of_prev_a = -1;
        prob_of_prev_b = -1;
        prev_n = -1;
        prob_of_zero = -1;
    }

    vector<mpz_class> get_prob_of_prev()
    {
        vector<mpz_class> ans{prob_of_prev_a, prob_of_prev_b, prev_n};
        return ans;
    }

    void set_prob_of_prev(mpz_class _prev_a, mpz_class _prev_b, mpz_class _prev_n)
    {
        prob_of_prev_a = _prev_a;
        prob_of_prev_b = _prev_b;
        prev_n = _prev_n;
    }

    TreeNode* get_child_by_prob(vector<bool>& q, mt19937& gen)
    {
        // sample from the distribution with prob_of_zero
        if (prob_of_curr_a == -1) {
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

    // Set the zero probability of the node
    // Also, construct the 0 and 1 branch
    void set_prob_of_zero(mpz_class _prev_a, mpz_class _prev_b, mpz_class _prev_n, mpz_class _a, mpz_class _b, mpz_class _n)
    {
        prob_of_curr_a = _a;
        prob_of_curr_b = _b;
        curr_n = _n;
        prob_of_zero = calc_prob_of_zero(_prev_a, _prev_b, _prev_n, _a, _b, _n);

        // the prev probability of 0 branch is curr probability of the parent node
        zero_child = new TreeNode();
        zero_child->set_prob_of_prev(_a, _b, _n);

        // Note that the 1 branch has different prev probability
        // which equals to prev probability - curr probability of the parent node
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

    mpz_class get_prob_of_curr_a()
    {
        return prob_of_curr_a;
    }
};

// Convert the bit string to the char string
// This is for UART commucations as we send the data byte by byte
string bitStringToString(string bitStr, int length)
{
    // fill 0 until the size is multiples of 8
    while (bitStr.size() != 8 * length)
    {
	    bitStr = "0" + bitStr;
    }
    string tmp, s;
    for (int i = 0;i < length;i++)
    {
        tmp = bitStr.substr(8*i, 8);
        int char_v = 0;
        for (int j = 0;j < 8;j++)
        {
            if (tmp[j] == '1')
            {
                char_v += (1 << (7-j));
            }
        }
        s += (char)char_v;
    }
    return s;
}

// Convert the char string to the bit string
string stringToBitString(string str){
    int tmp;
    string bs, tmp_s;
    for(int i = 0;i<str.size();i++)
    {
        tmp = (int)str[i];
        if (tmp < 0) tmp += 256;
        tmp_s = "";
        for (int j = 0;j < 8;j++)
        {
            if (tmp == 0)
            {
                tmp_s = "0" + tmp_s;
                continue;
            }
            if (tmp%2 == 1)
            {
                tmp_s = "1" + tmp_s;
            }
            else
            {
                tmp_s = "0" + tmp_s;
            }
            tmp = tmp/2;
        }
        bs += tmp_s;
    }
    return bs;
}

// Convert the bit string to integer
mpz_class bitStringToInt(string bitStr){
    mpz_class result;
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

// Below is the encoding of observables into bit strings
// I -> 0000
// Z -> 0001
// X -> 0010
// Y -> 0011
// 0 -> 1001
// 1 -> 1101
// + -> 1010
// - -> 1110
// +i (i) -> 1011
// -i (j) -> 1111

// get probability of measure q, used in sample node
vector<mpz_class> get_circuit_prob(vector<bool>& q, int n, mpz_class n_exp, SimpleSerial& serial)
{
    // generate input bit string
    string inputBitString = "";
    for (int i = 0 ; i < n ; i++)
    {
        if (i > q.size())
        {
            // I for unmeasured qubits
            inputBitString = "0000" + inputBitString;
        }
        else if (i == q.size())
        {
            // 0 for new measured qubit
            inputBitString = "1001" + inputBitString;
        }
        else
        {
            if (q[i])
            {
                inputBitString = "1101" + inputBitString;
            }
            else
            {
                inputBitString = "1001" + inputBitString;
            }
        }
    }

    // Communicate with serial
    string inputString, outputString;
    string outputBitString;
    string resultString;

    int inputLength = n/2 + n%2; // ceiling(n/2)

    inputString = bitStringToString(inputBitString, inputLength);
    string inputStringRev(inputString.rbegin(), inputString.rend()); // reverse the inputs to match the order
    serial.writeString(inputStringRev);

    // Here we fix the output length to be 8 bytes (64 bits)
    // It consists of k (exponent, 16 bits), a (24 bits), and b (24 bits)
    int outputLength = 8;
    outputString = serial.readString(outputLength);
    string outputStringRev(outputString.rbegin(), outputString.rend());
    resultString = stringToBitString(outputStringRev);

    // Calculate k, a, b
    mpz_class k, a, b;
    vector<mpz_class> result;
    k = bitStringToInt(resultString.substr(0, 16));
    a = bitStringToInt(resultString.substr(16, 24));
    b = bitStringToInt(resultString.substr(40, 24));
    k = k + n_exp;
    result.push_back(a);
    result.push_back(b);
    result.push_back(k);
    return result;
}

// get the expectation value of given observable, used in query mode
vector<mpz_class> get_obs_value(string obs, mpz_class n_exp, SimpleSerial& serial)
{
    // generate input bit string
    string inputBitString = "";
    for (int i = 0 ; i < obs.size() ; i++)
    {
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
                inputBitString += "1010";
                break;
            case '-':
                inputBitString += "1110";
                break;
            case 'i':
                inputBitString += "1011";
                break;
            case 'j':
                inputBitString += "1111";
                break;
            default:
                break;
        }
    }

    // Communicate with serial
    string inputString, outputString;
    string outputBitString;
    string resultString;

    int inputLength = obs.size()/2 + obs.size()%2; // ceiling(obs.size()/2)

    inputString = bitStringToString(inputBitString, inputLength);
    string inputStringRev(inputString.rbegin(), inputString.rend()); // reverse the inputs to match the order
    serial.writeString(inputStringRev);

    // Here we fix the output length to be 8 bytes (64 bits)
    // It consists of k (exponent, 16 bits), a (24 bits), and b (24 bits)
    int outputLength = 8;
    outputString = serial.readString(outputLength);
    string outputStringRev(outputString.rbegin(), outputString.rend());
    resultString = stringToBitString(outputStringRev);

    // Calculate k, a, b
    mpz_class k, a, b;
    vector<mpz_class> result;
    k = bitStringToInt(resultString.substr(0, 16));
    a = bitStringToInt(resultString.substr(16, 24));
    b = bitStringToInt(resultString.substr(40, 24));
    k = k + n_exp;
    result.push_back(a);
    result.push_back(b);
    result.push_back(k);

    // print the number in a, b, k format ((a + b * sqrt(2)) / 2 ^ k)
    gmp_printf("a = %Zd, b = %Zd, k = %Zd\n", a, b, k);
    return result;
}

// Branch and stop when a query is needed
pair<TreeNode*, TreeNode*> generate_query(const int n, vector<bool>& q, TreeNode* prev_node, TreeNode* current_node, mt19937& gen)
{
    while(current_node && (current_node->get_prob_of_curr_a()!=-1) && q.size() < n)
    {
        prev_node = current_node;
        current_node = current_node->get_child_by_prob(q, gen);
    }
    return make_pair(prev_node, current_node);
}

int main(int argc, char* argv[])
{
    // Create a random device and a generator
    std::random_device rd;
    std::mt19937 gen(rd());

    // Connect to serial
    SimpleSerial serial(argv[1], 115200);

    string mode = argv[2]; // -s or -q
    if (mode == "-s")
    {
        // Sample mode
        std::map<std::string, int> count; // record the shots
        const int total_shot = stoi(argv[3]);
        mpz_class n_exp = stoi(argv[4]);
        const int n = stoi(argv[5]);
        const int n_measure = stoi(argv[6]);

        // Time
        chrono::steady_clock::time_point begin, end;

        begin = chrono::steady_clock::now();
        TreeNode* root = new TreeNode();
        for(int i=0; i<total_shot; i++)
        {
            TreeNode* current_node = root;
            TreeNode* prev = nullptr;
            vector<bool> q;
            while(q.size() < n_measure)
            {
                pair<TreeNode*, TreeNode*> p = generate_query(n_measure, q, prev, current_node, gen);
                prev = p.first;
                current_node = p.second;

                if(q.size() == n_measure)
                {
                    // complete one shot
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

                vector<mpz_class> prob = get_circuit_prob(q, n, n_exp, serial);
                if(current_node->get_prob_of_curr_a() == -1)
                {
                    if(prev)
                    {
                        vector<mpz_class> prev = current_node->get_prob_of_prev();
                        current_node->set_prob_of_zero(prev[0], prev[1], prev[2], prob[0], prob[1], prob[2]);
                    }
                    else
                    {
                        // Root node, prev probability = 1
                        mpz_class numZero = 0;
                        mpz_class numOne = 1;
                        current_node->set_prob_of_zero(numOne, numZero, numZero, prob[0], prob[1], prob[2]);
                    }
                }
            }
        }
        end = chrono::steady_clock::now();

        // Print the sampling result
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
        // Query
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

        // Print the exact number
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
        // Unknown mode
        cout << "Mode not exist" << endl;
    }
    return 0;
}
