// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    mapping(address => uint256) private _balances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor(
        string memory name_,
        string memory symbol_,
        address originator_
    ) public {
        _name = name_;
        _symbol = symbol_;
        _decimals = 18;

        _mint(originator_, 1000000);
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public {
        require(msg.sender != address(0), "transfer from the zero address");
        require(recipient != address(0), "transfer to the zero address");

        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
    }

    function _mint(address account, uint256 amount) private {
        require(account != address(0), "mint to the zero address");

        _totalSupply += amount;
        _balances[account] += amount;
    }
}
