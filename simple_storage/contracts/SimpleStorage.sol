// SPDX-License-Identifier: MIT 
pragma solidity >=0.6.0 <0.9.0;

contract SimpleStorage {
    // this will get initialized to 0
    uint256 public favoriteNumber;

    // bool favoriteBool = false;
    // string favoriteString = "String";
    // int256 favoriteInt = -5;
    // address favoriteAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // bytes32 favoriteBytes = "cat";

    function store(uint256 _favoriteNumer) public {
        favoriteNumber = _favoriteNumer;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}