# K-Framework ![](https://img.shields.io/badge/-Live-brightgreen)

## Solidity Smart Contract - DeFi 

```
pragma solidity ^0.8.0;

contract DeFi {
    mapping(address => uint256) public balances;
    address public owner;
    address public lender;
    mapping(address => mapping(address => uint256)) public loans;

    event Deposit(address indexed from, uint256 value);
    event Withdraw(address indexed from, uint256 value);
    event Loan(address indexed from, address indexed to, uint256 value);
    event Repay(address indexed from, address indexed to, uint256 value);

    constructor() public {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0.");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        require(amount > 0, "Withdraw amount must be greater than 0.");
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    function lend(address borrower, uint256 amount) public {
        require(msg.sender == lender, "Only lender can lend.");
        require(balances[borrower] >= amount, "Borrower has insufficient balance.");
        require(amount > 0, "Loan amount must be greater than 0.");
        loans[borrower][lender] += amount;
        balances[borrower] -= amount;
        emit Loan(borrower, lender, amount);
    }

    function repay(address lender, uint256 amount) public {
        require(loans[msg.sender][lender] >= amount, "Insufficient loan balance.");
        require(amount > 0, "Repayment amount must be greater than 0.");
        loans[msg.sender][lender] -= amount;
        balances[msg.sender] += amount;
        emit Repay(msg.sender, lender, amount);
    }
}

```
## K Framework specification

```
module DeFi
    imports INT
    exports deposit, withdraw, lend, repay
    sorts address, uint256, mapping
    syntax address ::= "address" "(" "0x" [a-fA-F0-9]{40} ")"
    syntax balances ::= "balances"
    syntax loans ::= "loans"
    syntax owner ::= "owner"
    syntax lender ::= "lender"
    syntax msg ::= "msg"
    syntax sender ::= "sender"
    syntax borrower ::= "borrower"
    syntax amount ::= "amount"
    syntax value ::= "value"
    rules 
    deposit()
    requires msg.value > 0
    ensures balances[msg.sender] = old(balances[msg.sender]) + msg.value
    withdraw(amount:uint256)
    requires balances[msg.sender] >= amount
    requires amount > 0
    ensures balances[msg.sender] = old(balances[msg.sender]) - amount
    lend(borrower:address, amount:uint256)
    requires msg.sender == lender
    requires balances[borrower] >= amount
    requires amount > 0
    ensures loans[borrower][lender] = old(loans[borrower][lender]) + amount
    ensures balances[borrower] = old(balances[borrower]) - amount
    repay(lender:address, amount:uint256)
    requires loans[msg.sender][lender] >= amount
    requires amount > 0
    ensures loans[msg.sender][lender] = old(loans[msg.sender][lender]) - amount
    ensures balances[msg.sender] = old(balances[msg.sender]) + amount
endmodule

```
