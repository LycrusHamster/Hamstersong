// SPDX-License-Identifier: MIT

pragma solidity =0.7.4;

import "../code/Hamstersong.sol";

contract Wrapper {

    event Success(uint256 gasUsed);

    Hamstersong private song;

    constructor() {
        song = new Hamstersong();
    }

    function calcGas() external returns(bool){

        bytes32 target = hex"2c63a4a42443ea678f8f62997fd1ec7771f6cbc79aa71f3eb7495f3b3f183669";

        bytes32 high = hex"6162636465666768696a6b6c6d6e6f707172737475767778797a303132333435";
        bytes32 low = hex"363738396162636465666768696a6b6c00000000000000000000000000000000";
        uint256 gas = gasleft();
        bytes32 ret = song.hash(high,low);
        gas = gas-gasleft();
        if(keccak256(abi.encode(ret)) == keccak256(abi.encode(target))){
            emit Success(gas);
            return true;
        }

        return false;
    }

    function littleTest() external returns(bool){

        bytes32 target = hex"2c63a4a42443ea678f8f62997fd1ec7771f6cbc79aa71f3eb7495f3b3f183669";
        bytes32 high = hex"6162636465666768696a6b6c6d6e6f707172737475767778797a303132333435";
        bytes32 low = hex"363738396162636465666768696a6b6c00000000000000000000000000000000";
        bytes32 ret =  song.hash(high,low);
        if(keccak256(abi.encode(ret)) != keccak256(abi.encode(target))){
            revert("case 0");
        }

        target = hex"a43a1b9f4d1a59ff7356c8dadcef899bc91246b829ba28175e0529c35ab7b26d";
        high = hex"3131313131313131313131313131313131313131313131313131313131313131";
        low = hex"3131313131313131313131313131313100000000000000000000000000000000";
        ret =  song.hash(high,low);
        if(keccak256(abi.encode(ret)) != keccak256(abi.encode(target))){
            revert("case 1");
        }

        emit Success(0);
        return true;
    }
}
