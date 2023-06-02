pragma solidity > 0.8.0;


contract Counter{
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increament() external;
    
}  

contract MyContract {
    function increamentCounter(address _counter) external {
        ICounter(_counter).increament();
    }
    function getCount(address _counter) external view returns(uint){
        return ICounter(_counter).count();
    }
}