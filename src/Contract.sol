// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

error E(uint code, string message);

contract Contract {
    function f() public {
        revert E(1337, "This is an error message!");
    }

    function fAssembly() public {
        assembly {
            mstore(0, 0xad4e867300000000000000000000000000000000000000000000000000000000)   // keccak256(E(uint256,string))
            mstore(4, 1337)                                                                 // Error code
            mstore(36, 64)                                                                  // Offset for error message
            mstore(68, 25)                                                                  // Length of error message
            mstore(100, "This is an error message!")                                        // Error message
            revert(0, 132)
        }
    }
}
