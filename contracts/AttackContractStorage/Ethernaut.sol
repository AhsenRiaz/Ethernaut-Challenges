// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "../helpers/Ownable-05.sol";

contract AlienCodex is Ownable {
    bool public contact;
    bytes32[] public codex;

    modifier contacted() {
        assert(contact);
        _;
    }

    function make_contact() public {
        contact = true;
    }

    function record(bytes32 _content) public contacted {
        codex.push(_content);
    }

    // Underflow attack, result in giving access to contract storage
    function retract() public contacted {
        codex.length--;
    }

    // We can change the owner from this function if we know where owner in stored in the contract storage.
    function revise(uint i, bytes32 _content) public contacted {
        codex[i] = _content;
    }
}
