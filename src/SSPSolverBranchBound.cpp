#include <SubsetSumSolver.h>
#include <algorithm>

bool func(std::pair<long, long> &a, std::pair<long, long> &b){
    return a.first < b.first;
}

long binary_search(long value, std::vector<std::pair<long, long>> &v, long begin, long end){
    if(begin>end) return -1;
    long mid = (begin+end) >> 1;
    if(v[mid].first == value) return v[mid].second;
    else if(v[mid].first < value) return binary_search(value, v, mid + 1, end);
    else return binary_search(value, v, begin, mid-1);
}

bool SSPSolverBranchBound::solve(const std::vector<long> &input, long value, std::vector<char> &output) {
    output.resize(input.size());
    std::vector<long> v1, v2;
    long l = (input.size()%2 == 0) ? input.size() >> 1 : (input.size() >> 1) + 1;
    v1.resize(l); v2.resize(input.size()-l);
    std::copy(input.begin(), input.begin() + l, v1.begin());
    std::copy(input.begin()+l, input.end(), v2.begin());
    std::vector<std::pair<long, long>> s1(1<<v1.size(), std::make_pair(0, 0)), s2(1<<v2.size(), std::make_pair(0, 0));
    long aux, aux2;
    for(long i = 0; i < s1.size(); ++i){
        aux = i;
        s1[i].second = i;
        for(long j = 0; j < v1.size() && aux > 0; ++j, aux = aux >> 1){
            s1[i].first += (aux%2) * v1[j];
        }
    }
    for(long i = 0; i < s2.size(); ++i){
        aux = i;
        s2[i].second = i;
        for(long j = 0; j < v2.size() && aux > 0; ++j, aux = aux >> 1){
            s2[i].first += (aux%2) * v2[j];
        }
    }
    std::sort(s1.begin(), s1.end(), func);
    for(long i = 0; i < s2.size(); ++i){
        aux = binary_search(value - s2[i].first, s1, 0, s1.size() - 1);
        if(aux != -1){
            for(long j = 0; j < v1.size() && aux > 0; ++j, aux = aux >> 1){
                output[j] = (aux%2) ? true : false;
            }
            aux2 = i;
            for(long j = v1.size(); j < input.size() && aux2 > 0; ++j, aux2 = aux2 >> 1){
                output[j] = (aux2%2) ? true : false;
            }
            return true;
        }        
    }
    return false;   
}
