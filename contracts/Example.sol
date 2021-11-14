// SPDX-License-Identifier: MIT

import "redstone-flash-storage/lib/contracts/message-based/PriceAware.sol";

pragma solidity ^0.8.2;

contract Example is PriceAware {

  uint256 private lastPrice = 0;
  
  // Example of a public function that updates the state
  function setCurrentPrice() public {
    uint256 tslaPrice = getPriceFromMsg(bytes32("TSLA"));
    lastPrice = tslaPrice;
  }

  // Example of a read-only view function
  function isOverpriced() public view returns(bool) {
    uint256 tslaPrice = getPriceFromMsg(bytes32("TSLA"));
    return tslaPrice > 1000 * 10 ** 8;
  }

  // Example of a read-only view function, that fetches the saved price from state
  function getLastPrice() public view returns(uint256) {
    return lastPrice;
  }
}
