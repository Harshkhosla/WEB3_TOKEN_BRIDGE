// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;


import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IHarshtoken{
    function mintto(uint amount , address to)external;
}
contract Staking is Ownable{
    address implementation;
    uint public totalStake;
    mapping(address=>uint) Ethstaked;
    mapping (address =>uint) Rewards;
    mapping(address=>uint)StakedAt;

    constructor(address _implementation)Ownable(msg.sender){
    implementation= _implementation;
    }

    // constructor(address _implementation)Ownable(msg.sender){
    // implementation= _implementation;
    // }


    function rewardtillnow(address _address) internal view returns (uint){
         uint lastStake = StakedAt[_address];
         require(lastStake > 0, "User has not staked yet");
         uint secondsPassed = block.timestamp - lastStake;
         uint rewardamount = secondsPassed*Ethstaked[_address];
         return rewardamount;
    }
    function stake(uint amount ) public payable {
        require(amount>0,'more amount is required');
         uint rewardamount=rewardtillnow(msg.sender);
         StakedAt[msg.sender]=block.timestamp;
         Rewards[msg.sender]+=rewardamount;
         Ethstaked[msg.sender]+=amount;
         totalStake+=amount;
    }
    function claimReward(uint amount) public{
        uint rewards = rewardtillnow(msg.sender);
        Rewards[msg.sender]+=rewards;
        require(rewards>amount);
        // uint amounttakenout = Rewards[msg.sender] - amount;
        Rewards[msg.sender]-=amount;
        StakedAt[msg.sender]=block.timestamp;
        IHarshtoken(implementation).mintto(amount, msg.sender);
        payable(msg.sender).transfer(amount);
    }
      function unStake(uint amount ) public   {
        require(amount<= Ethstaked[msg.sender],'more amount is required');
          uint rewardamount=rewardtillnow(msg.sender);
        Rewards[msg.sender]+=rewardamount;
        StakedAt[msg.sender]=block.timestamp;
        Ethstaked[msg.sender]-=amount;
        totalStake-=amount;
        payable(msg.sender).transfer(amount);
    }

    function getReward() public view  returns(uint) {
        uint amount = Ethstaked[msg.sender];
        return amount;
    }

    function clainRewards() public payable{

    }
}