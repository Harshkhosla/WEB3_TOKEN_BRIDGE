// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/StakingContract/Harsh.sol";
contract HarshTest is Test {
    Harsh harshContract;

    function setUp() public {
        harshContract = new Harsh();
    }

    function testmintto() public {
        address testAddress = 0x3346f16dc0eAdf3E0dE8C9C1EE283d45d5983AdB;
        harshContract.mintto(1, testAddress);
        vm.prank(testAddress);
        uint256 balance = harshContract.balanceOf(testAddress);
        assertGt(balance, 0);
    }

    function testsetStakingContract() public {
        address testAddress = 0x3346f16dc0eAdf3E0dE8C9C1EE283d45d5983AdB;
        harshContract.setStakingContract(testAddress);
        assertEq(testAddress,harshContract.getStakingContract());
    }
}
