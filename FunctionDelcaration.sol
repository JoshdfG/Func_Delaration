// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DepositContract {
    mapping(address => uint256) public balances;

    event Deposit(address indexed depositor, uint256 amount);


    function deposit() public payable {
        require (msg.sender != address(0), "Can't deposit from address zero");
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }


    function pureExample(uint8 _a, uint8 _b) external pure returns(uint8){
        uint8 sum = _a + _b;
        return sum;
    }

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }
}