// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;


import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface BHarshToken is IERC20{
     function mint(address _to, uint256 _amount) external;
    function burn(address _from, uint256 _amount) external;
}
contract BridgeBase is ERC20 , Ownable{ 
    address tokenAddress;
    event Burn(address indexed burner, uint amount);
    mapping(address=>uint) BrigedTokens;
    constructor(address _tokenAddress) Ownable(msg.sender) {
        tokenAddress=_tokenAddress;
    }


    function widthraw(BHarshToken _tokenAddress, uint256 _amount)public{
        require(BrigedTokens[msg.sender]>=_amount);
        BrigedTokens[msg.sender] -= _amount;
        _tokenAddress.mint(msg.sender,_amount);
    }

    function burn (BHarshToken _tokenAddress , uint amount) public {
        require(address(_tokenAddress) == tokenAddress);
        _tokenAddress.burn(msg.sender,amount);
        emit Burn(msg.sender, _amount);
    }
    function depositHppenedonOtherSide(address owner ,uint amount)public {
        BrigedTokens[owner]+=amount;
    }
}
