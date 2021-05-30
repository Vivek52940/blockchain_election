// SPDX-License-Identifier: MIT 
pragma solidity ^0.5.16;

contract Election{
    //struct candidate
    
    //mapping candidate
    //constructor
    
    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }
    
    //candidate count 
    uint public candidatesCount;
    
    mapping(uint => Candidate) public candidates;
    
    mapping(address => bool) public votedornot;
    
    event electionUpdated(
        uint id,
        string name,
        uint votecount);
    
    constructor () public {
        // the code  that we want to initiate
        // elon musk and sundar pichai
        addCandidate("elon musk");
        addCandidate("sundar pichai");

    }
    
    // add candidates
    
    function addCandidate(string memory name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,name,0);
    }
    
    function Vote(uint _id)public{
        // the person has not voted again
        require(!votedornot[msg.sender],'you have voted for the participant');
        // the id that the person has input is available
        require(candidates[_id].id !=0,'the doesnt exist');
          votedornot[msg.sender] = true;
        // increase the vote count of the person whom the he voted
        candidates[_id].votecount++;
        //bool true
        
        emit electionUpdated(_id,candidates[_id].name,candidates[_id].votecount);
    }
}    