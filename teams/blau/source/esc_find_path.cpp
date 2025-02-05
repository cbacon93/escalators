#include "mex.h"
#include <stdio.h>
#include <vector>
#include <cmath>
#include <ctime>

using namespace std;

#include "esc_vector2.h"
#include "esc_heap.h"
#include "esc_arraylist.h"
#include "esc_mine.h"
#include "esc_node.h"
#include "esc_nodegrid.h"
#include "esc_pathfinder.h"

void mexFunction(int outCount,mxArray *outVars[],int inCount,const mxArray *inVars[]) {
    static vector<Mine> mineList = vector<Mine>();
    static Nodegrid nodeGrid = Nodegrid();
    static bool firstRound = true;
            
    if (inCount <= 0)
        mexErrMsgIdAndTxt("MATLAB:textfunc:inputArgumentNumber", "Not Enough input arguments!");
    if (!mxIsStruct(inVars[0]))
        mexErrMsgIdAndTxt("MATLAB:textfunc:inputNotStruct", "First Parameter must be a structure");
    
    if (firstRound || mineList.size() != mxGetNumberOfElements(inVars[0])) {
        //mexPrintf("Reparsed MineList\n");
        mineList = Mine::parseMineStruct(inVars[0]);
        //mexPrintf("Recalculate Nodegrid\n");
        nodeGrid.setupNodeGrid(mineList);
    }
    
    /*for (int i=0; i<mineList.size(); i++) {
        mexPrintf("mine: r: %f, pos: [%f, %f]\n", mineList[i].radius, mineList[i].pos.x, mineList[i].pos.y);
    }*/
    
    //find path
    Vector2 startp = Vector2(inVars[1]);
    Vector2 endp = Vector2(inVars[2]);
    
    clock_t start;
    double duration;
    start = clock();
    
    vector<Vector2> wps = Pathfinder::findPath(nodeGrid, startp, endp);
    
    duration = ( std::clock() - start ) / (double) CLOCKS_PER_SEC;
    //mexPrintf("Path (%d nodes) found in %f s\n", wps.size(), duration);
    
    outVars[0] = mxCreateCellMatrix(1, wps.size());
    for (int i=0; i < wps.size(); i++) {
        double * dynamicData;
        dynamicData = (double*)mxMalloc(2 * sizeof(double));
        
        dynamicData[0] = (double)wps[i].x;
        dynamicData[1] = (double)wps[i].y;
        
        mxArray * tmp = mxCreateDoubleMatrix(1, 2, mxREAL);
        mxSetPr(tmp, dynamicData);
        
        mxSetCell(outVars[0], i, tmp);
    }
    
    firstRound = false;
}