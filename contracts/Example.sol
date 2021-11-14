// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Example {

  uint256 private lastPrice = 0;
  
  // Example of a public function that updates the state
  function setCurrentPrice() public {
    uint256 tslaPrice = 0; // let's fetch the real price using RedStone oracles
    lastPrice = tslaPrice;
  }

  // Example of a read-only pure function
  function isOverpriced() public pure returns(bool) {
    uint256 tslaPrice = 0; // let's fetch the real price using RedStone oracles
    return tslaPrice > 1000 * 10 ** 8; // RedStone values has 8 decimals
  }

  // Example of a read-only view function, that fetches the saved price from state
  function getLastPrice() public view returns(uint256) {
    return lastPrice;
  }
}
