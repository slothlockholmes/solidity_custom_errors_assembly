// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Contract.sol";

contract TestContract is Test {
    Contract c;

    function setUp() public {
        c = new Contract();
    }

    function testF() public {
        vm.expectRevert(
            abi.encodeWithSelector(
                E.selector,
                1337,
                bytes("This is an error message!")
            )
        );
        c.f();
    }

    function testFAssembly() public {
        vm.expectRevert(
            abi.encodeWithSelector(
                E.selector,
                1337,
                bytes("This is an error message!")
            )
        );
        c.fAssembly();
    }
}
