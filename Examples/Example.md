# K-Framework

### Example 1 

#### Solidity Smart Contract - Transfer

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

#### K Framework specification

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

### Example 2

#### Solidity Smart Contract - DEX 

```
pragma solidity ^0.8.0;

contract DEX {
    mapping (address => mapping(address => uint256)) balances;
    address[] public tokens;

    event Trade(address indexed token, address indexed from, address indexed to, uint256 value);

    function trade(address token, address to, uint256 value) public {
        require(balances[msg.sender][token] >= value, "Insufficient balance.");
        require(balances[to][token] + value > balances[to][token], "Overflow.");
        balances[msg.sender][token] -= value;
        balances[to][token] += value;
        emit Trade(token, msg.sender, to, value);
    }

    function addToken(address token) public {
        require(tokens.length == 0 || tokens[tokens.length-1] != token, "Token already added.");
        tokens.push(token);
    }
}

```

#### K Framework specification

```
module DEX
    imports INT
    exports trade, addToken
    sorts address, uint256, mapping, list
    syntax address ::= "address" "(" "0x" [a-fA-F0-9]{40} ")"
    syntax uint256 ::= "uint256" "(" "0x" [a-fA-F0-9]{64} ")"
    syntax mapping ::= "mapping" "(" address " => " mapping (address => uint256) ")"
    syntax balance ::= "balances"
    syntax msg ::= "msg"
    syntax sender ::= "sender"
    syntax token ::= "token"
    syntax to ::= "to"
    syntax value ::= "value"
    syntax tokens ::= "tokens"
    syntax len ::= "length"
    syntax push ::= "push"
    syntax last ::= "last"
    rules
    trade(token:address, to:address, value:uint256)
    requires balance[msg.sender][token] >= value
    requires balance[to][token] + value > balance[to][token]
    ensures balance[msg.sender][token] = old(balance[msg.sender][token]) - value 
    ensures balance[to][token] = old(balance[to][token]) + value
    addToken(token:address)
    requires (len[tokens] == 0) || (last[tokens] != token)
    ensures len[tokens] = old(len[tokens]) + 1
    ensures last[tokens] = token
endmodule


```
