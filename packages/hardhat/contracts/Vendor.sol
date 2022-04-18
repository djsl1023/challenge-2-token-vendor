pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  //event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }
  uint256 public constant tokensPerEth = 100;
  // ToDo: create a payable buyTokens() function:
  function buyTokens() public payable {
    uint256 tokensToDispense = msg.value * tokensPerEth;
    yourToken.transfer(msg.sender, tokensToDispense);
    emit BuyTokens(msg.sender, msg.value, tokensToDispense);
  }
  // ToDo: create a withdraw() function that lets the owner withdraw ETH
  function withdraw() public onlyOwner {
    uint256 currBalance = address(this).balance;
    payable(address(owner())).transfer(currBalance);
  }
  // ToDo: create a sellTokens() function:

}
