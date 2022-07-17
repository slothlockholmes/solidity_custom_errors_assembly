// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

error E(uint code, string message);

contract Contract {
    function f() public {
        revert E(1337, "This is an error message!");
    }

    function fAssembly() public {
        assembly {
            mstore(0, 0xad4e867300000000000000000000000000000000000000000000000000000000)
            mstore(4, 1337)
            mstore(36, 64)
            mstore(68, 25)
            mstore(100, "This is an error message!")
            revert(0, 132)
        }
    }
}
