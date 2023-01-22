# K-Framework ![](https://img.shields.io/badge/-Live-brightgreen)

## Solidity Smart Contract - CrowdFunding 

```
pragma solidity ^0.8.0;

contract CrowdFunding {
    address public owner;
    uint256 public goal;
    uint256 public deadline;
    mapping(address => uint256) public contributions;
    address[] public contributors;

    event FundTransfer(address indexed from, uint256 value);
    event GoalReached();
    event GoalNotReached();
    event ProjectExpired();

    constructor(uint256 _goal, uint256 _deadline) public {
        owner = msg.sender;
        goal = _goal;
        deadline = _deadline;
    }

    function contribute() public payable {
        require(msg.value > 0, "Contribution must be greater than 0.");
        require(now <= deadline, "Project has expired.");
        contributions[msg.sender] += msg.value;
        contributors.push(msg.sender);
        emit FundTransfer(msg.sender, msg.value);
        checkGoal();
    }

    function checkGoal() private {
        if (contributions[owner] >= goal) {
            emit GoalReached();
        } else if (now > deadline) {
            emit ProjectExpired();
        } else {
            emit GoalNotReached();
        }
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        require(contributions[owner] >= goal || now > deadline, "Goal not reached or project not expired.");
        msg.sender.transfer(contributions[owner]);
    }
}
```

## K Framework specification

```
module CROWDFUNDING
    imports INT
    exports contribute, withdraw, checkGoal
    sorts address, uint256, mapping, list
    syntax address ::= "address" "(" "0x" [a-fA-F0-9]{40} ")"
    syntax uint256 ::= "uint256" "(" "0x" [a-fA-F0-9]{64} ")"
    syntax mapping ::= "mapping" "(" address " => " uint256 ")"
    syntax contributions ::= "contributions"
    syntax contributors ::= "contributors"
    syntax msg ::= "msg"
    syntax sender ::= "sender"
    syntax value ::= "value"
    syntax now ::= "now"
    syntax goal ::= "goal"
    syntax deadline ::= "deadline"
    syntax owner ::= "owner"
    syntax push ::= "push"
    syntax len ::= "length"
    syntax last ::= "last"
    rules 
    contribute()
    requires msg.value > 0
    requires now <= deadline
    ensures contributions[msg.sender] = old(contributions[msg.sender]) + msg.value
    ensures len[contributors] = old(len[contributors]) + 1
    ensures last[contributors] = msg.sender
    checkGoal()
    requires contributions[owner] >= goal
    ensures GoalReached()
    requires now > deadline
    ensures ProjectExpired()
    requires (contributions[owner] < goal) && (now <= deadline)
    ensures GoalNotReached()
    withdraw()
    requires msg.sender == owner
    requires (contributions[owner] >= goal) || (now > deadline)
    ensures msg.sender.transfer(contributions[owner])
endmodule
```
