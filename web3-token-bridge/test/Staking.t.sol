
// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/StakingContract/Staking.sol";

contract StakingTest is Test {
    Staking stakeContract;
    fallback() external payable {}
    receive() external payable {}

    function setUp() public {
        stakeContract = new Staking(address(this));
    }

    function teststakeEth() public {
    vm.startPrank(0x3346f16dc0eAdf3E0dE8C9C1EE283d45d5983AdB);
       stakeContract.stake(100);
       assertEq(stakeContract.getReward(),100,"ok");
    }


    function testunStake() public {
          address user = 0x3346f16dc0eAdf3E0dE8C9C1EE283d45d5983AdB;
        vm.deal(user, 100 ether);
        vm.startPrank(user);
        stakeContract.stake{value:100}();
        assertEq(stakeContract.getReward(),100,"ok");
        stakeContract.unStake(10);
        //  assertEq(address(this).balance,90,"ok");
    }
}
