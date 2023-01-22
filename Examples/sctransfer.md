# K-Framework ![](https://img.shields.io/badge/-Live-brightgreen)


## Solidity Smart Contract - Transfer

```
pragma solidity ^0.7.0;

contract Token {
    mapping (address => uint256) balances;

    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance.");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}
```

## K Framework specification

```
module TOKEN
    imports INT
    exports transfer
    sorts address, uint256, mapping
    syntax address ::= "address" "(" "0x" [a-fA-F0-9]{40} ")"
    syntax uint256 ::= "uint256" "(" "0x" [a-fA-F0-9]{64} ")"
    syntax mapping ::= "mapping" "(" address " => " uint256 ")"
    syntax balance ::= "balances"
    syntax msg ::= "msg"
    syntax sender ::= "sender"
    syntax _to ::= "to"
    syntax _value ::= "value"
    rules
    transfer(to:address, value:uint256)
    requires balance[msg.sender] >= value
    ensures balance[msg.sender] = old(balance[msg.sender]) - value 
    ensures balance[to] = old(balance[to]) + value
endmodule

```

