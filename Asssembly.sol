pragma solidity  > 0.8.0;


contract LearnAssembly{

    function addToEVM() external pure {
        uint x;
        uint y;
        //uint z = x + y;

         assembly {
        let z := add(x,y)
    } 
    } 
     //if functioons for you can insert all these into the assembly

     /* load data for a specific slot 
     //let a := mload(0*40)
     // store something temporarily to memory
     mstore(a,4)
     // persistance storage!
     sstore(a,100)

     /*in EVM everything is stored in slots of 256 bits( most varible occupy one slot)
      whereas mappign and arrays is severl*/

      function addToEVM2(address addr) public view returns(bool success){
          uint size;
           // check whether an address contains any bytes of code or not
          assembly {
              size := extcodesize(addr)
          }
          if(size > 0) {return true;
          } else {
              return false;
          }
      }
 
      function addToEVM3() external pure {
          
          bytes memory data = new bytes(10);
          bytes32 dataB32 = bytes32(data);
          assembly {
              dataB32 := mload(add(data,32))
          }
      }

   
}