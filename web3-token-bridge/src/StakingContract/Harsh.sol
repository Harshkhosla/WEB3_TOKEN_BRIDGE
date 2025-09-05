// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;


import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Harsh is ERC20, Ownable{
    address public stakingContractAddress;
    constructor()ERC20("HARSH", "MUASH") Ownable(msg.sender){
    }
    function setStakingContract(address _stakingContractAddress) public onlyOwner{
        stakingContractAddress=_stakingContractAddress;
    }
    function getStakingContract() public view returns (address) {
    return stakingContractAddress;
}
    function mintto(uint amount , address to) public onlyOwner {
        _mint(to, amount);
    }
}