pragma solidity ^0.4.18;

contract Token {
	uint internal _totalSupply = 0;
	uint internal _raiseAmount = 0;
	mapping (address => uint) paid;
	struct Transaction {
 		string name;
		uint amount;
	}
	string promisedWork;
	struct completedTransaction {
		string work ;
		uint amount;
	}
	Transaction[] transactions;    
	completedTransaction trans;
}

contract userToken is Token {
	function donate(string _name, uint _value) public{
		transactions.push(Transaction(_name, _value));		
		paid[msg.sender] = paid[msg.sender]+_value;
		_totalSupply = _totalSupply+_value;
	}
	function donatedMoney() public returns (uint ) {
		uint amount = paid[msg.sender];
		return amount;
	}
	
	function check() public returns (string, uint){
		string work = trans.work;
		uint amount = trans.amount;
		if(keccak256(work) == keccak256("")) {
		        return ("Week is not over yet.",amount);
			//work =	"Week is not over yet.";
			//work = work1;
		}		
		//uint amount = trans.amount;
		return (work,amount);
	}
	
	event WorkDone();
	event WorkNotDone();
	function useCharity() public {
		if(_totalSupply >= _raiseAmount) {
			uint amount = _raiseAmount;
			_totalSupply = _totalSupply - _raiseAmount;
			string work =  promisedWork;
			trans = completedTransaction(work,amount);
			WorkDone;
		}
		else {
			//string work1 = "Goal forwarded next week.";
			amount = 0;
			trans = completedTransaction("Goal forwarded next week.",amount);
			WorkNotDone();
		}
	}
	function setGoal(string _work, uint _amount) public {
		promisedWork = _work;
		_raiseAmount = _amount;
	}
}

