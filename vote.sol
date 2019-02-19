pragma solidity ^0.4.25;

contract vote {
    address owner;
    string title;
    bool ending;
    mapping (string=>uint256) inform;
    mapping (address=>bool) voter;
    
    constructor(string _title) public {
        title = _title;
        owner = msg.sender;
    }
    
    function voting (string _choice) public {
        require(!voter[msg.sender]);
        require(!ending);
        voter[msg.sender] = true;
        require(inform[_choice] < inform[_choice] + 1);
        inform[_choice] += 1;
    }
    
    function show_information (string _choice) view public returns(string, string, uint256){
        return (title, _choice, inform[_choice]);
    }
    
    function end () public {
        require(owner == msg.sender);
        ending = true;
    }
}
