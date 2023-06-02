pragma solidity >0.8.0;

/* A cryprographic hash function ()*/



contract Oracle {
    address admin;
    uint public rand;

    constructor() public {
        admin = msg.sender;
    } 


    function feedRand(uint _rand) external {
         require(msg.sender == admin);
        rand = _rand;
       
    }
}

contract GenerateRandomNumber {
    Oracle oracle;

    constructor(address oracleAddress) public {
        oracle = Oracle(oracleAddress);
    }

    
    function randMod(uint range) external view returns(uint){
        return uint(keccak256(abi.encodePacked(oracle.rand, block.timestamp, block.prevrandao, msg.sender))) % range;
    }
}