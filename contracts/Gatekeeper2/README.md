# Task: Hack through all the modifiers and attack the enter function

Modifier#1
The attack will be carried out on it by another contract. Not the tx.origin but the contractI;

Modifier#2
Modifier check will require the contract size to be 0. But how can we call from a contract which has 0 size. The trick is to call from inside the constructor. While the constructor is running the size of the contract is 0. After constructor succefully executes then the contract size is stamped.

Modifier#3
Modifier#3 require a xor b = c.
It is mathematically proved that a xor c = b
hence through changing the position of variables we will find the key and then attack enter function
