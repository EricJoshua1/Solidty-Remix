pragma solidity > 0.8.0;

/* -You can have multiple definitions for the same function name in the same scope.
-The definition of the function must differ from each other by the types or 
the number of arguments in the argument list.
-You cannot overload function delcarations that differ only by return type. */


contract FunctionOverloading {
    function x(bool TruthOrDare) public {

    }
    function x(uint distanceRun) public {

    }
}

// Exercise

contract OverlapingExecise {

    function getSum(uint a, uint b, uint c) public pure returns(uint){
        return a + b + c;
    }
    function getSum(uint a, uint b) public pure returns(uint){
        return a + b;
    }
    function getsumThreeArgs () public pure returns(uint){
        return getSum(4,5,6); 
    }
    function getsumTwoArgs () public pure returns(uint){
        return getSum(4,5); 
    }
    
}