pragma solidity > 0.8.0;

/*contract withdrawalPattern {
    modifier onlyOwner {
        require(true);
        _;
    }
    function returnFunds() public onlyOwner returns(bool success){
        for(uint i = 0; funders.length; i++){
            funders[i].transfer(contributedAmount);
        }
        return true;
    }
    function returnfunds()public onlyOwner returns(bool success){
        tatiana.transfer(contributedAmount);
        john.tranfer(contributedAmount);
        return true;
    }
    fallback () public{}
} */

/*contract withdrawalPattern {
    function claimRefund() public {
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);
    }
}*/
contract withdrawalFunction{
    uint balance; 
    function withdrawalFunds(uint amount)public view returns(bool succes){
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return true;
    }
}