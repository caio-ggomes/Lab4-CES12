#include <SubsetSumSolver.h>


bool SSPSolverPD::solve(const std::vector<long> &input, long value, std::vector< char> &output){
    output.resize(input.size());
    std::vector<std::vector<bool>> backpacks(input.size()+1);
    for(std::vector<std::vector<bool>>::iterator itr = backpacks.begin(); itr != backpacks.end(); ++itr){
        (*itr).resize(value+1, false);
        (*itr)[0] = true;
    }
    for(long line = 1; line <= input.size(); ++line){
        for(long column = 1; column <= value; ++column){
            if(input[line-1] > column) backpacks[line][column] = backpacks[line-1][column];
            else backpacks[line][column] = backpacks[line-1][column] || backpacks[line-1][column - input[line-1]];
        }
    }
    if(backpacks[input.size()][value]){
        long column = value;
        long line = input.size();
        while(column != 0){
            if(backpacks[line-1][column]){
                output[line-1] = false;
                line--;
            }
            else{
                output[line-1] = true;
                column -= input[line-1];
                line--;
            }
        }
    }
    return backpacks[input.size()][value];
}
