#include <stdlib.h>
#include <algorithm>
#include <iostream>
#include <stdlib.h>
#include <sstream>
#include <fstream>
#include <vector>
#include <omp.h>
#include <queue>
#include <math.h>

#define left(i)   ((2*i) + 1)
#define right(i)  ((2*i) + 2)
#define parent(i) ((i - 1) >> 1)

/* Type to represent a list of circles */
typedef struct {
    float x, y, r;
} circle_list_t;

/* Type to represent a list of query data-points */
typedef struct {
    float x, y;
} query_list;
    // An item on the intermediate result queue
    struct HeapItem {
        HeapItem( float index, float dist, float x, float y) :
        index(index), dist(dist) ,x(x), y(y){}
        float index;
        float dist;
        float x;
        float y;
        bool operator<(const HeapItem& o) const {
            return dist > o.dist;
        }
    };
    
float compute_distance(float *vp_x,float *vp_y,float *qx,float *qy)
{

    return  sqrt( (*vp_x- *qx)*(*vp_x - *qx) + (*vp_y- *qy)*(*vp_y - *qy) ) ;
    
}

 void print_vp_tree_data(std::vector<circle_list_t> vp_tree,int n)
 {
    
    for (int i=0;i<n; ++i)
    {
        std :: cout << vp_tree[i].x << " " <<vp_tree[i].y  << " " << " " << vp_tree[i].r << std::endl;
    }

 }

void print_query_data(std::vector<query_list>& query,int n)
 {
    
    for (int i=0;i<n; ++i)
    {
        std :: cout << query[i].x << " " <<query[i].y << std::endl;
    }

 }

void save_time(int iteration, double time_taken )
{
    std::ofstream MyFile;
    MyFile.open ("../data/queries/point_search_timings.txt", std::ios_base::app) ;
    
      
    MyFile<< iteration << " " << time_taken << "\n";

       
    
MyFile.close();

}
int point_search(std::vector<circle_list_t>& vp, float qx, float qy,  int n, int path)
{
   // std :: cout << "\n ------\n---------\n " << std :: endl;
    //int path = 0;
    /* Index of current node */
    int i = 0;

    

    /* Index of previous node */
    int j = -1;

    /* Distance of currently checked point */
    float d;
                        
    
    while (i <= n )  
    {
        
        //if ( i >= n) j=i , i = parent(i), path++ ;
        //else
        //{
        /* Calculate distance of query from node's point */

        d = compute_distance(&vp[i].x, &vp[i].y, &qx, &qy);    // Compute distance between target and current node

        
        if (d == 0)
        {   
        //    std :: cout << "Found exact match!  " <<  d << " path = " << path << std :: endl;
            return path;
        }

        else
        {
       
            /* Proceed to left or right child depending on whether q is inside or outside the circle */
            if (d <= vp[i].r) j = i, i = left(i), path++; 
            else              j = i, i = right(i), path++;

        }
      
        
    }   


    return path;
}



int main(int argc, char const *argv[])
{

    int  k;
    
    //k = atoi(argv[1]);

    /*Reading Query data*/
    std :: ifstream infile;
    infile.open("../data/query_point_searches.txt"); // open file
    int query_size;
    if(infile)
    {   
        std :: string s="";
        getline(infile,s);
      
        
        query_size = atoi(s.c_str());
//       std :: cout << query_size << std :: endl;

    }

    std::vector<query_list> query(query_size); 
        int i=0;
        while(i<query_size)
        { 
        std :: string s="";
         
        getline(infile,s);

        char* pEnd;

        query[i].x = (strtod (s.c_str(), &pEnd)) ;
        query[i].y =(strtod (pEnd, NULL));
        i++;
        }
    

    infile.close();


  //  print_query_data(query,query_size);



    /*Reading VP Tree data*/

    std :: ifstream vp_infile;
    vp_infile.open("../data/vp_tree_build_for_point_search.txt"); // open file
    int vp_data_size;
    if(vp_infile)
    {   
        std :: string s="";
        getline(vp_infile,s);
        
        vp_data_size = atoi(s.c_str());
  //      std :: cout << vp_data_size << std :: endl;

    }
  //  std :: cout << vp_data_size << std :: endl;
    std::vector<circle_list_t> vp(vp_data_size); // vector to temporarily store points   

    
    
   
    i=0;
    int c = 0;
    int l = 0;
    while(!vp_infile.eof() )
    {
        if (c%3 == 0)   vp_infile >> vp[l].x;
    
        else if (c%3 == 1) vp_infile >> vp[l].y;
        
        else
            {
            vp_infile >> vp[l].r;
            l++;
            }
    c++;
    }

     

    vp_infile.close();
    

    //print_vp_tree_data(vp,vp_data_size);


    int iteration = query_size;
    
    std::vector<int> pathlength;

    double startp = omp_get_wtime();
    while (query_size--)
    {
       

    int path = point_search(vp,query[i].x,query[i].y,vp_data_size,0);
    std :: cout << path << std :: endl;
    

    i++;
    }
    double endp = omp_get_wtime();

    save_time(iteration,endp-startp);
    

    //std :: cout << iteration << " " << endp - startp << std :: endl;



    return 0;
}





