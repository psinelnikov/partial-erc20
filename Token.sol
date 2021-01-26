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
    }

    function name() public view returns (string memory) {}

    function symbol() public view returns (string memory) {}

    function balanceOf(address account) public view returns (uint256) {}

    function transfer(address recipient, uint256 amount) public {}

    function _mint(address account, uint256 amount) private {}
}
