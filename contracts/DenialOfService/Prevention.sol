// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Prevention {
    address king;
    uint256 public prize;
    address public owner;
    mapping(address => uint) public balances;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
        balances[msg.sender] = msg.value;

    }

    receive() external payable {
        require(msg.value > balances[msg.sender], "");
        balances[king] += msg.value;
        king = msg.sender;
        prize = msg.value;

    }

    function withdraw() public payable {
        require(balances[msg.sender] > 0);
        require(msg.sender != king);
        uint balance = balances[msg.sender];
        balances[msg.sender] = 0;
       (bool success, ) = msg.sender.call{value: balance}("");
       require(success);

    }

    function _king() public view returns (address) {
        return king;
    }
}
