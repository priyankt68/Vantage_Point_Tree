#include <iostream>
#include <fstream>
#include <chrono>
#include <random>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

int main(int argc, char const *argv[])

{

	int n = atoi(argv[1]);
	// construct a trivial random generator engine from a time-based seed:
	unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
	std::default_random_engine generator (seed);

	std::uniform_real_distribution<float> x_distribution (0.0,1.0);
	std::uniform_real_distribution<float> y_distribution (0.0,1.0);

 	std::ofstream MyFile;

	MyFile.open ("../../data/data1.txt",std::ofstream::out | std::ofstream::trunc) ;
 	
 	MyFile << n << "\n";
    for (int i = 0; i < n ; i++)
    {               
    	MyFile << x_distribution(generator) << " " << y_distribution(generator) << "\n";
	}
    
MyFile.close();

    return 0;
}

