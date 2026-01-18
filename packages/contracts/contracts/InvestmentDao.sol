// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract InvestmentToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("InvestmentToken", "INV") {
        _mint(msg.sender, initialSupply);
    }
}

contract InvestmentDao {
    address public owner;
    InvestmentToken public token;
    uint public proposalCount;

    struct Proposal {
        string description;
        uint votesFor;
        uint votesAgainst;
        bool executed;
    }

    mapping(uint => Proposal) public proposals;
    mapping(address => mapping(uint => bool)) public voted;

    constructor(address tokenAddress) {
        owner = msg.sender;
        token = InvestmentToken(tokenAddress);
    }

    function createProposal(string memory description) external {
        proposals[proposalCount] = Proposal(description, 0, 0, false);
        proposalCount++;
    }

    function vote(uint proposalId, bool support) external {
        require(!voted[msg.sender][proposalId], "Already voted");
        voted[msg.sender][proposalId] = true;

        uint weight = token.balanceOf(msg.sender);
        require(weight > 0, "No tokens to vote");

        if (support) {
            proposals[proposalId].votesFor += weight;
        } else {
            proposals[proposalId].votesAgainst += weight;
        }
    }

    function executeProposal(uint proposalId) external {
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Already executed");
        require(proposal.votesFor > proposal.votesAgainst, "Proposal failed");

        proposal.executed = true;
        // Add custom execution logic here (e.g., release funds)
    }
}
