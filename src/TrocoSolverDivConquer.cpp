#include <TrocoSolver.h>

unsigned int DCMakeChange(const std::vector<unsigned int> &denom, unsigned int value, std::vector<unsigned int> &last){
    if(value == 0) return 0;
    unsigned int q = value, pos = 0, aux;
    for(std::vector<unsigned int>::const_iterator itr = denom.begin(); itr != denom.end(); ++itr, ++pos){
        if(*itr > value) continue;
        aux = DCMakeChange(denom, value - *itr, last);
        if(q > 1 + aux){ q = 1 + aux; last[value] = pos;}
    }
    return q;
}


void TrocoSolverDivConquer::solve(const std::vector<unsigned int> &denom,unsigned int value, std::vector<unsigned int> &coins) {
   
    coins.resize(denom.size(),0);
    std::vector<unsigned int> last(value + 1);
    last[0] = 0;
    DCMakeChange(denom, value, last);
    for(unsigned int aux = value; aux > 0; coins[last[aux]]++, aux -= denom[last[aux]]);
    
}//solve
