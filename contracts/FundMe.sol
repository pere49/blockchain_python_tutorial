// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;
    
    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        // determine the conversion rate 
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        // value is to 10^8
        return uint256(answer);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000;
        return ethAmountInUsd;
    }
}