// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/StakeETH.sol";

contract StakeETHTest is Test {
    StakeETH stakeContract;
    
    // Add receive function to accept ETH
    receive() external payable {}

    function setUp() public {
        stakeContract = new StakeETH();
    }

    function teststakeEth() public {
       stakeContract.stakeEth{value: 1 ether}(1 ether);
       assertEq(stakeContract.totalStaked(), 1 ether, "Stake amount mismatch");
    }

    function teststakeOut() public {
        // First stake some ETH
        stakeContract.stakeEth{value: 1 ether}(1 ether);
        assertEq(address(stakeContract).balance, 1 ether, "Contract balance incorrect");
        assertEq(stakeContract.totalStaked(), 1 ether, "Initial stake amount incorrect");
        uint256 initialBalance = address(this).balance;
        stakeContract.stakeOut(1 ether);
        assertEq(stakeContract.totalStaked(), 0.5 ether, "Withdrawn amount mismatch");
        assertEq(address(this).balance, initialBalance + 0.5 ether, "ETH not received");
    }
}
