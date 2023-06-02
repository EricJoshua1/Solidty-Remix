pragma solidity > 0.8.0;

contract Owner {
    //function modifier
    address owner; 
    // when we deploy this contract we want to set the address to the owner (msg.sender)
    // we also use constructor because we want to immideately set the address upon deployment
    constructor() public {
        // here we set the owner address to us(the person calling the contract)
        owner = msg.sender;
    }
    // now we write our function modifier
    // to write the modifier we statically declare the modifier keyword and then name it and inside we write our logic and modifications
    modifier  onlyOwner {
       // here we can write any kind of custormizable logic to modify the function
       require(msg.sender == owner);
       _;
       // the undersocre continues with the function
    }

}
  //is is a keyword grabbing inheritance from another contract- owner
contract Register is Owner {
    mapping (address => bool) registeredAddresses;
    uint price;

    constructor(uint initialPrice) public {
        price = initialPrice;
    }
 // function register will set msg.sender (current caller) to true
    function register() public payable {
        // the logic will modify the ooutcome
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint _price) public onlyOwner {
        // onlyOwner is in the function modifier but it isn't recognized by the IDE so that's why it is not highlighted so it needs to be created above
        price = _price;
    }
}