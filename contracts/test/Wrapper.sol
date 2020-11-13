// SPDX-License-Identifier: MIT

pragma solidity =0.7.4;

import "../code/Hamstersong.sol";

contract Wrapper {

    event Success();

    Hamstersong private song;

    constructor() {
        song = new Hamstersong();
    }

    function calcGas() external returns(bool){
        bytes memory payload = abi.encodePacked(
            hex"aa6d7de46162636465666768696a6b6c6d6e6f707172737475767778797a303132333435363738396162636465666768696a6b6c"
        );
        (bool success, bytes memory returnData) =  address(song).call(payload);
        bytes memory target = hex"2c63a4a42443ea678f8f62997fd1ec7771f6cbc79aa71f3eb7495f3b3f183669";
        if(success && keccak256(returnData) == keccak256(target)){
            emit Success();
            return true;
        }
        return false;
    }

    function littleTest() external returns(bool){

        bytes memory payload = abi.encodePacked(
            hex"aa6d7de46162636465666768696a6b6c6d6e6f707172737475767778797a303132333435363738396162636465666768696a6b6c"
        );
        (bool success, bytes memory returnData) =  address(song).call(payload);
        bytes memory target = hex"2c63a4a42443ea678f8f62997fd1ec7771f6cbc79aa71f3eb7495f3b3f183669";
        if(!success || keccak256(returnData) != keccak256(target)){
            revert("case 1");
        }


        payload = abi.encodePacked(
            hex"aa6d7de4313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131"
        );
        (success, returnData) =  address(song).call(payload);
        target = hex"a43a1b9f4d1a59ff7356c8dadcef899bc91246b829ba28175e0529c35ab7b26d";
        if(!success || keccak256(returnData) != keccak256(target)){
            revert("case 2");
        }

        emit Success();
        return true;
    }
}
