pragma solidity >0.8.0;
    
    // Destructuring Assignments and Solidity Tricks
    // solidity functions can return  multiple variables of different types.
    // if you only want to keep one variable , the you can declare a variable and then use commas:

contract DestructuringFunctions{
    uint public changeValue;
    string public  tom= 'hello';

    function f() public pure returns (uint, bool, string memory){
        return (3, true, 'Goodbye');
    }
    function g() public {
        ( changeValue,,tom) = f();
    }

}