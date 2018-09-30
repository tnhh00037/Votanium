pragma solidity ^0.4.21;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {
    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    /**
    * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract Votanium {
    using SafeMath for uint256;

    struct voter {
        address voterAddress;
        uint tokensBought;
        uint[] tokensUsedPerCandidate;
    }
    
    address public owner;
    
    mapping (bytes32=>uint) public votesReceived;
    mapping(address => voter) public voterInfo;
    mapping(address => bool) public votedList;

    uint constant NOT_VOTING = 0; // Not in voting
    uint constant IN_VOTING = 1; // In voting
    uint constant END_VOTING = 2; // End voting

    address public adminAddress;
    address public walletAddress;
    address[] arrayVoter;

    uint voteState;
    uint256 totalVoteAmount;
    bool public inActive;
    bool public isVoting;
    
    uint public totalTokens;
    uint public balanceTokens;
    uint public tokenPrice;


    mapping(address => uint256) internal balances;

    event StartVoting(uint state); // Start voting
    event EndVoting(uint state); // End voting
    
    bytes32[] public candidateList;
    
    modifier onlyOwnerOrAdmin() {
        require(msg.sender == owner || msg.sender == adminAddress);
        _;
    }
    
    constructor (uint _totalTokens, uint _tokenPrice, address _walletAddress, address _adminAddress) public {
        require(_walletAddress != address(0));
        require(_adminAddress != address(0));
        
        walletAddress = _walletAddress;
        adminAddress = _adminAddress;
        totalTokens = _totalTokens;
        balanceTokens = _totalTokens;
        inActive = true;
        tokenPrice = _tokenPrice;
        totalVoteAmount = 0;
    }
    
    function buy() payable public {
        uint tokensToBuy = msg.value / tokenPrice;
        require(tokensToBuy <= balanceTokens);
        voterInfo[msg.sender].voterAddress = msg.sender;
        voterInfo[msg.sender].tokensBought += tokensToBuy;
        walletAddress.transfer(msg.value);
        balanceTokens -= tokensToBuy;
    }


    // Add Candidate List
    function addCandidateList(bytes32 _candidateName) external onlyOwnerOrAdmin {
        bool isExist = validCandidate(_candidateName);
        if(isExist != true){
            candidateList.push(_candidateName);   
        }
    }

    // Start voting
    function startVoting() external onlyOwnerOrAdmin returns (bool)  {
        require(voteState == NOT_VOTING);
		
        voteState = IN_VOTING;
        isVoting = true;
        emit StartVoting(voteState);
        return true;
    }

    // End voting
    function endVoting() external onlyOwnerOrAdmin returns (bool) {
        require(voteState == IN_VOTING);
		
        voteState = END_VOTING;
        isVoting = false;
        emit EndVoting(voteState);
        return true;
    }

    function voteForCandidate(bytes32 candidate, uint tokens) public {
        // Check to make sure user has enough tokens to vote
        // Increment vote count for candidate
        // Update the voter struct tokensUsedPerCandidate for this voter
        require(votedList[msg.sender] != true);
        uint availableTokens = voterInfo[msg.sender].tokensBought - totalTokensUsed(voterInfo[msg.sender].tokensUsedPerCandidate);
        
        require(tokens <= availableTokens, "You don't have enough tokens");
        votesReceived[candidate] += tokens;

        if (voterInfo[msg.sender].tokensUsedPerCandidate.length == 0) {
            for(uint i=0; i<candidateList.length; i++) {
                voterInfo[msg.sender].tokensUsedPerCandidate.push(0);
            }
        }

        uint index = indexOfCandidate(candidate);
        voterInfo[msg.sender].tokensUsedPerCandidate[index] += tokens;
        votedList[msg.sender] = true;
    }

    function indexOfCandidate(bytes32 candidate) view public returns(uint) {
        for(uint i=0; i<candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return i;
            }
        }
        return uint(-1);
    }

    function totalTokensUsed(uint[] _tokensUsedPerCandidate) private pure returns (uint) {
        uint totalUsedTokens = 0;
        for(uint i=0; i<_tokensUsedPerCandidate.length; i++) {
            totalUsedTokens += _tokensUsedPerCandidate[i];
        }
        return totalUsedTokens;
    }

    function voterDetails(address user) view public returns (uint, uint[]) {
        return (voterInfo[user].tokensBought, voterInfo[user].tokensUsedPerCandidate);
    }

    function tokensSold() public view returns (uint) {
        return totalTokens - balanceTokens;
    }

    function allCandidates() public view returns (bytes32[]) {
        return candidateList;
    }

    function totalVotesFor(bytes32 candidate) public view returns (uint) {
        return votesReceived[candidate];
    }
  

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
           if (candidateList[i] == candidate) {
             return true;
           }
        }
        return false;
    }
    
}

