// SPDX-License-Identifier: MIT




pragma solidity ^0.8.26;




contract Vote {


    struct Voter {
        string name;
        uint age;
        uint voterId;
        Gender gender;
        uint voteCandidateId;  //
        address voterAddress;
    }


    struct Candidate {
        string name;
        string party;
        uint age;
        Gender gender;
        uint candidateId;
        address candidateAddress;
        uint votes;
    }


    address electionCommission;
    address public winner;
    uint nextVoterId = 1;
    uint nextCandidateId = 1;
    uint startTime;
    uint endTime;
    bool stopVoting;


    mapping(uint => Voter) voterDetails;
    mapping(uint => Candidate) candidateDetails;


    enum VotingStatus {NotStarted, InProgress, Ended}
    enum Gender {NotSpecified, Male, Female, Other}


    constructor() {
        electionCommission=msg.sender ;   //msg.sender is a global variable 
    }


    modifier isVotingOver() {
        require(block.timestamp<=endTime  && stopVoting==false,"voting is over");
      _;
    }


    modifier onlyCommissioner() {
        require(msg.sender==electionCommission,"not authorized to conduct voting");
        _;
    }


    function registerCandidate(
        string calldata _name,
        string calldata _party,
        uint _age,
        Gender _gender
    ) external {
        require(_age>=18, "you not eligible");
        require(isCandidateNotRegistered(msg.sender),"you are already registered");
        require(nextCandidateId<3,"candidate registeration is full");
        require(msg.sender!=electionCommission,"electioncommision not allowed");
        candidateDetails[nextCandidateId]=Candidate(
            _name,
            _party,
            _age,
            _gender,
            nextCandidateId,
            msg.sender,
            0
        );
        nextCandidateId++;
       
    }


    function isCandidateNotRegistered(address _person) internal view returns (bool) {
           
    }


    function getCandidateList() public view returns (Candidate[] memory) {
     
    }


    function isVoterNotRegistered(address _person) internal view returns (bool) {
         
    }


    function registerVoter(
        string calldata _name,
        uint _age,
        Gender _gender
    ) external {
        require(_age>=18, "you not eligible");
        require(isVoterNotRegistered(msg.sender),"you are already registered");
        
        
        voterDetails[nextVoterId]=Voter(
            _name,
            _age,
            nextVoterId,
            _gender,
            0,
            msg.sender
        );
        nextVoterId++;




    }


    function getVoterList() public view returns (Voter[] memory) {
   
    }


    function castVote(uint _voterId, uint _id) external {
   
    }


    function setVotingPeriod(uint _startTime, uint _endTime) external onlyCommissioner() {
   
    }


    function getVotingStatus() public view returns (VotingStatus) {
   
    }


    function announceVotingResult() external onlyCommissioner() {
   
    }


    function emergencyStopVoting() public onlyCommissioner() {
        stopVoting=true;
       
    }
}











