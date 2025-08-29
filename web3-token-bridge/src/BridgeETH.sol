// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract BridgeETH is  Ownable{ 
    address tokenAddress;
    mapping(address=>uint) Bridgecontracts;
    event Deposit(address indexed depositor, uint amount);
    constructor(address _tokenAddress) Ownable(msg.sender) {
        tokenAddress= _tokenAddress;
    }

    function deposite(IERC20 _tokenAddress,uint amount ) public {
        require(address(tokenAddress)==_tokenAddress);
    require(_tokenAddress.allowance(msg.sender,address(this))>=amount);
    _tokenAddress.transferFrom(msg.sender,address(this),amount);
    emit Deposit(msg.sender,amount);
    Bridgecontracts[msg.sender]+=amount;
    }

    function Withdraw(IERC20 _tokenAddress,uint amount) public {
    require(address(tokenAddress)==_tokenAddress);
    require(Bridgecontracts[msg.sender]>=amount);
    Bridgecontracts[msg.sender]-=amount;
    _tokenAddress.transfer(msg.sender,amount);
    }

    function isBurnedtoken(uint amount) public onlyOwner{
        require(Bridgecontracts[msg.sender]>=amount);
        Bridgecontracts[msg.sender]-=amount;
    }

}


