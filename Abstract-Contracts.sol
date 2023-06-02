pragma solidity > 0.8.0;

 contract Calculator{
    function getResult() public pure virtual returns(uint){}
}

contract Test is Calculator{
    function getResult() public pure override virtual  returns(uint){
        uint a = 1;
        uint b = 2;
        uint result;
        return result = a + b;
    }
}
    
