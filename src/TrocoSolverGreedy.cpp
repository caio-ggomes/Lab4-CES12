#include <TrocoSolver.h>

void TrocoSolverGreedy::solve(const std::vector<unsigned int> &denom,unsigned int value, std::vector<unsigned int> &coins) {
  
    coins.resize(denom.size(),0);
    unsigned int change = 0;
    unsigned int pos = denom.size();
    for(std::vector<unsigned int>::const_reverse_iterator itr = denom.rbegin(); itr != denom.rend() && change < value; ++itr){
        --pos;
        while(change + *itr <= value){
            change += *itr;
            coins[pos]++;
        }
    }
    
}//solve

// dica: iterar um vetor de tras pra frente
//https://stackoverflow.com/questions/3610933/iterating-c-vector-from-the-end-to-the-begin
//http://www.cplusplus.com/reference/vector/vector/rbegin/
