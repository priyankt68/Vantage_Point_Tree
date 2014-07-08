#include <iostream>
#include <algorithm>
#include <fstream>
#include <chrono>
#include <random>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std; 

struct point     
{
    float x;
    float y;

    point() : x(0), y(0) {}
     point(float x1, float y1){x = x1; y = y1;}
};

int main(int argc, char const *argv[])

{
	int n;
	
	std :: ifstream infile;

    infile.open("../../data/data1.txt"); // open file
    
    if(infile)
    {   
         std :: string s="";
        getline(infile,s);
        
        n = atoi(s.c_str());
    }

    std::vector<point> points(n/2); 

        int i=0;
        while(i<n/2)
        { 
        std :: string s="";
         
        getline(infile,s);

        char* pEnd;

        points[i].x = (strtod (s.c_str(), &pEnd)) ;
        points[i].y =(strtod (pEnd, NULL));
        i++;
        }
    
    std::random_shuffle (points.begin(), points.end());

    infile.close();

	// construct a trivial random generator engine from a time-based seed:
	unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
	std::default_random_engine generator (seed);

	std::uniform_real_distribution<float> x_distribution (0.0,1.0);
	std::uniform_real_distribution<float> y_distribution (0.0,1.0);

 	std::ofstream outFile;

	outFile.open ("../../data/query_point_searches.txt",std::ofstream::out | std::ofstream::trunc) ;
 	
 	outFile << n << "\n";

    for (int i = 0; i < n/2 ; i++)
    {               
        outFile << points[i].x << " " << points[i].y << "\n";
    }

    for (int i = 0; i < (n - (n/2)) ; i++)
    {               
    	outFile << x_distribution(generator) << " " << y_distribution(generator) << "\n";
    }
    
    

	outFile.close();

    return 0;
}

