// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract EtherBorrowLend {
    address public owner;
    uint256 public contractBalance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit() public payable onlyOwner {
        // Accept Ether deposit from the owner
        require(msg.value > 0, "You must send Ether to deposit");
        contractBalance += msg.value;
    }

    function borrow(uint256 amount) public payable {
        require(amount > 0, "Borrowed amount must be greater than zero");
        require(amount <= contractBalance / 10, "You can borrow up to 10% of the contract's value");
        require(msg.value == amount, "You must send exactly the requested amount of Ether");

        // Transfer Ether to the borrower
        payable(msg.sender).transfer(amount);

        // Update contract balance
        contractBalance -= amount;
    }

    function repay() public payable {
        require(msg.value > 0, "You must send Ether to repay the loan");
        require(msg.value <= address(this).balance, "Contract balance is insufficient to repay the loan");

        // Update contract balance
        contractBalance += msg.value;
    }

    function withdrawFunds() public onlyOwner {
        // Only the owner can withdraw funds from the contract
        payable(owner).transfer(address(this).balance);
    }
}