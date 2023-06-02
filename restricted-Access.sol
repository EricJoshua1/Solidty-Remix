pragma solidity > 0.8.0;


contract restrictedAccess{
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    modifier onlyBy(address _account){
    require(msg.sender == _account,
    'sender not authorized!'
    );
    _;
    }

    modifier onlyAfter(uint time){
        require(block.timestamp >= time,
        'function called early!'
        );
        _;
    }

    function changeOwner(address _owner) onlyBy(owner) public {
        owner = _owner;
    }

    function disown() onlyBy(owner) onlyAfter(creationTime + 3 seconds) public{
        delete owner;

    }
     
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