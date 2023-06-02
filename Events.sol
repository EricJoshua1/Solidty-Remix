pragma solidity > 0.8.0;

contract LearnEvents{
    // its good to write Capital first letter for naming the event
    event NewTrade(
        uint date,
        address from,
        address to,
        uint amount;
    )
    function Trade(address to, uint amount) external {
        //outside consumer can see the event through web3.js
        emit NewTrade(block.timestamp, to, amount);
    }
