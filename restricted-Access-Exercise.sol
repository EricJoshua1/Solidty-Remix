pragma solidity > 0.8.0;


contract costRestrictedAccess{

    address public owner = msg.sender;

    modifier costs(uint _amount){
        require(msg.value >= _amount,
        'Not enough Ether provided'
        );
        _;
    }

    function forceOwnerChange(address _newOwner) costs(200 ether) public payable{
        owner = _newOwner;
    }
}