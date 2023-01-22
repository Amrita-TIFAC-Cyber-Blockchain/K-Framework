# K-Framework ![](https://img.shields.io/badge/-Live-brightgreen)

## Solidity Smart Contract - DAO 

```
pragma solidity ^0.8.0;

contract DAO {
    address public owner;
    mapping(address => bool) public members;
    mapping(address => uint256) public votingPower;
    mapping(address => bool) public proposals;

    event NewMember(address indexed member);
    event Proposal(address indexed member, bool vote);
    event ProposalResult(bool result);

    constructor() public {
        owner = msg.sender;
        members[msg.sender] = true;
        votingPower[msg.sender] = 1;
        emit NewMember(msg.sender);
    }

    function addMember(address newMember) public {
        require(msg.sender == owner, "Only the owner can add new members.");
        require(members[newMember] == false, "Member already exists.");
        members[newMember] = true;
        votingPower[newMember] = 1;
        emit NewMember(newMember);
    }

    function propose(address member, bool vote) public {
        require(members[msg.sender] == true, "Sender is not a member.");
        proposals[member] = vote;
        emit Proposal(member, vote);
    }

    function vote(address member) public {
        require(members[msg.sender] == true, "Sender is not a member.");
        require(proposals[member] != false, "Proposal not found.");
        uint256 yesVotes = 0;
        uint256 noVotes = 0;
        for (address i in members) {
            if (proposals[member] == true) {
                yesVotes += votingPower[i];
            } else {
                noVotes += votingPower[i];
            }
        }
        bool result = (yesVotes > noVotes);
        emit ProposalResult(result);
    }
}

```

## K Framework specification

```
module DAO
    imports INT
    exports addMember, propose, vote
    sorts address, mapping, bool
    syntax address ::= "address" "(" "0x" [a-fA-F0-9]{40} ")"
    syntax members ::= "members"
    syntax votingPower ::= "votingPower"
    syntax proposals ::= "proposals"
    syntax msg ::= "msg"
    syntax sender ::= "sender"
    syntax member ::= "member"
    syntax vote ::= "vote"
    syntax owner ::= "owner"
    rules 
    addMember(member:address)
    requires msg.sender == owner
    requires members[member] == false
    ensures members[member] == true
    ensures votingPower[member] == 1
    propose(member:address, vote:bool)
    requires members[msg.sender] == true
    ensures proposals[member] == vote
    vote(member:address)
    requires members[msg.sender] == true
    requires proposals[member] != false
    ensures (yesVotes > noVotes) == proposals[member]
    where yesVotes = sum i in members votingPower[i] when proposals[member] == true
    and noVotes = sum i in members votingPower[i] when proposals[member] != true
endmodule

```
