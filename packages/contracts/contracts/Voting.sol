// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        string description;
        uint256 votes;
    }

    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;

    function createProposal(string memory description) public {
        proposals.push(Proposal(description, 0));
    }

    function vote(uint256 proposalId) public {
        require(!hasVoted[msg.sender], "Already voted");
        proposals[proposalId].votes++;
        hasVoted[msg.sender] = true;
    }

    function getProposal(uint256 proposalId) public view returns (string memory, uint256) {
        Proposal memory p = proposals[proposalId];
        return (p.description, p.votes);
    }
}
