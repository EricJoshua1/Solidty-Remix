pragma solidity > 0.8.0;

contract auction{
    address payable public  beneficiary;
    uint public auctionEndTime;
    address public highestBidder;
    uint public highestBid;
    bool ended;

    mapping(address => uint) pendingReturns;

    event hihgestBidIncreased(address bidder,uint amount);
    event auctionEnded(address winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary){
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {
        if(block.timestamp > auctionEndTime) revert('the auction has ended!');
        if(msg.value <= highestBid) revert('bid is not high enough!');
        if(highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit hihgestBidIncreased(msg.sender, msg.value);
    }

    function withdraw() public payable returns(bool succes) {
        uint amount = pendingReturns[msg.sender];
        if(amount > 0){
            pendingReturns[msg.sender] = 0;
        }
        if(!payable(msg.sender).send(amount)){
            pendingReturns[msg.sender] = amount;
        }
        return true;
    } 
      function auctionEnd() public {
          if(block.timestamp < auctionEndTime) revert('the auction has not ended yet!');
          if(ended) revert('the auction is already over!');
          ended = true;
          emit auctionEnded(highestBidder, highestBid);
          beneficiary.transfer(highestBid);
      }

}