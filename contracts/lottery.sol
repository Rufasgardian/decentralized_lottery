pragma solidity >=0.4.26;

contract Lottery{
    
    address public manager;
    address[] public players;
    
    constructor() public{
        manager = msg.sender;
    }
    
    function enter() public payable{
        
        require(msg.value > .01 ether);
        
        players.push(msg.sender);
    }
    
    function pickWinner() public restricted{
        
        uint index = (now*4) % players.length;
        
        players[index].transfer(address(this).balance); // take whole balance from currnt contract and give transfer it to players.[index]
        players = new address[](0); // making players array empty (by creating new instance of dynamic array of address (0) - 0 length by default
    }
    
    // D.R.Y - dont repeat yourself
    modifier restricted() {
        require(msg.sender == manager);
        _; // its simply to show all the lines of codes of function using this modifier
    }
    
    function getPlayers() public view returns (address[] memory){
        return players;
    }
    
    
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           