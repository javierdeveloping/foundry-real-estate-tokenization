// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import {DeployRealEstateNFT} from "../script/DeployRealEstateNFT.s.sol";
import {RealEstateNFT} from "../src/RealEstateNFT.sol";

contract RealEstateNFTTest is StdCheats, Test {
    DeployRealEstateNFT public deployRealEstateNFT;
    RealEstateNFT public realEstateNFT;
    address public OWNER = address(1);


    function setUp() public {
        deployRealEstateNFT = new DeployRealEstateNFT();
    }

    function testDeploymentIsV1() public {
        address proxyAddress = deployRealEstateNFT.deployRealEstateNFT();
        uint256 expectedValue = 1;
        assertEq(expectedValue, RealEstateNFT(proxyAddress).version());
    }

    function testRevertWhenCallingInitializeAgain() public {
        address proxyAddress = deployRealEstateNFT.deployRealEstateNFT();
        
        address minter = makeAddr("NEW MINTER");
        address pauser = makeAddr("NEW PAUSER");
        address defaultAdmin = makeAddr("NEW DEFAULT_ADMIN");
        address upgrader = makeAddr("NEW UPGRADER");

         vm.expectRevert(abi.encodeWithSelector(Initializable.InvalidInitialization.selector));
    
        RealEstateNFT(proxyAddress).initialize(defaultAdmin,pauser,minter,upgrader);
    }

    
}