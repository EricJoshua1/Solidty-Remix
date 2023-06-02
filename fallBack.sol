pragma solidity > 0.8.0;

// Define fallback functions:
// 1.cannot be named
// 2. do not take any inputs
// 3. do not return any outputs
// 4. must be decalred as exteranal

/*why use it ? when you call functions that does not exist - or send ether to a contract by send , transfer or call
statement; send and transfer method recieves 2300 gas but call method receives more (all of the gas)*/

contract Fallback { //not recommended to write much code in here- cuz the function will fail

    event Log(uint gas);

    fallback () external payable {
        emit Log(gasleft());

    } 
    function getbalance() public view returns(uint){
         //return the stored balance of the contract
    return address(this).balance;
    }
   

}
/* new contract will send ether to fallback contract which will trigger fallback functions*/

contract SendToFallBack{

    function tranferToFallBack(address payable _to) public payable {
        _to.transfer(msg.value);
        //send ether with the transfer method 
        // automatically transfer will transfer 2300 amount
    }

    function callFallBack(address payable _to) public payable {
        (bool sent,) = _to.call{value:msg.value}('');
        require(sent, 'failed to send!');
    }
}