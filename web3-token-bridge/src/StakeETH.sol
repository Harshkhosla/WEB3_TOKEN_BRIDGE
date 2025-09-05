// // SPDX-License-Identifier: Unlicense
// pragma solidity ^0.8.13;


// import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

 
 
// contract StakeETH is Ownable{ 
//     address contractAddress;
//     mapping(address=>uint)stakinguser;
//     uint  public  totalStaked;

//     constructor() Ownable(msg.sender){
//     }

//     function stakeEth(uint amount) public payable {
//         require(amount==msg.value);
//          totalStaked += amount;
//         stakinguser[msg.sender]+=amount;
//     }

//     function stakeOut(uint amount) public {
//         require(stakinguser[msg.sender] >= amount, "Not enough staked");
//         uint256 withdrawAmount = amount / 2;
//         totalStaked -= withdrawAmount;
//         stakinguser[msg.sender] -= withdrawAmount;
//         payable(msg.sender).transfer(withdrawAmount);
//     }

// }