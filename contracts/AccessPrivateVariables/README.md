# Task: Access Private Variables In Smart Contract

In solidity private variables are private for other smart contracts. Other smart contract cannot access them. But these private variables remain public for the outside world. We can access these variables if we know the smart contract address and the storage position of the variable

In this example we will use Web3.js

```bash
await web3.eth.getStorageAt("0x749aB0448e404fD85c8135bE959E9835379cfAE4", 1)
```
