// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

pragma solidity ^0.8.9;

contract QuCoin is ERC20, ERC20Burnable, Ownable{
    event TokensBurned(address indexed owner, uint amount, string message);
    event TokensMinted(address indexed owner, uint amount, string message);
    event AdditionalTokensMinted(address indexed owner, uint amount, string message);

    constructor() ERC20("QuCoin", "QUC") {
        _mint(msg.sender, 1000 * 10**decimals());
    }

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
        emit AdditionalTokensMinted(to, amount, "Minted additional tokens.");
    }

    function burn (uint amount) public override onlyOwner {     
        _burn(msg.sender,amount);
        emit TokensBurned(msg.sender, amount, "Burned tokens");
    }
}