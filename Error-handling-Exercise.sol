pragma solidity > 0.8.0;

contract Vendor{
    address  seller;

    modifier onlyseller(){
        require(msg.sender == seller,
        'only  the seller can sell this!');
        _;
    }
    function becomeSeller() public {
        seller = msg.sender;
    }
    function sell(uint amount) payable public onlyseller {
        if(amount > msg.value) {
            revert('There is not enough ether provided');
        }
    }
}