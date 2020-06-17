#include <TrocoSolver.h>

void TrocoSolverPD::solve(const std::vector<unsigned int> &denom,unsigned int value, std::vector<unsigned int> &coins) {
   
    coins.resize(denom.size(),0); 
    std::vector<unsigned int> quant(value + 1), last(value + 1);
    quant[0] = 0; last[0] = 0;
    unsigned int curquant, curlast, pos;
    for(unsigned int cents = 1; cents <= value; ++cents){
        curquant = cents;
        curlast = 0;
        pos = 0;
        for(std::vector<unsigned int>::const_iterator itr = denom.begin(); itr != denom.end(); ++itr, ++pos){
            if(*itr > cents) continue;
            if(quant[cents - *itr] + 1 < curquant){
                curquant = quant[cents - *itr] + 1;
                curlast = pos;
            }
        }
        quant[cents] = curquant;
        last[cents] = curlast;
    }
    for(unsigned int aux = value; aux > 0; coins[last[aux]]++, aux -= denom[last[aux]]);
    
}//solve
