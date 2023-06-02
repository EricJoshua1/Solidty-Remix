pragma solidity > 0.8.0;
 
// view functionns ensure that they will not modify the state (return values).
// Pure functions ensure that they not read or modify the state ( return calculations).

contract MyContract {
    uint value;
  // setValue modifies the state value
    function setValue(uint _value) external {
        value = _value;
    }
    // but the getValue function doesn't modifies the state variavle it only 
    // returns the value which is set by the setValue funtion (it is read Only function)
    // so the view keyword insures that the functions only is for reading nothing else.
    function getValue() external view returns(uint){
        return value;
    }
    // pure can be used when returning a calculation
    function getNewValue() external pure returns(uint){
        return 3 + 3;
    }

}