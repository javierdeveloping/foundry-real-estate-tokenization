// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script,console} from "forge-std/Script.sol";
import {RealEstateNFT} from "../src/RealEstateNFT.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployRealEstateNFT is Script {
    function run() external returns (address) {
        address proxy = deployRealEstateNFT();
        return proxy;
    }

    function deployRealEstateNFT() public returns (address) {
        vm.startBroadcast();
        console.log("Caller address:", msg.sender);

        //the same address is used for pauser, defaultAdmin, upgrader and minter
        //it can be modified as preferred.
        address defaultAdmin = msg.sender;
        address pauser = msg.sender;
        address upgrader = msg.sender;
        address minter = msg.sender;

        //deploy implementation or logic contract
        RealEstateNFT collection = new RealEstateNFT();

        //deploy proxy
        ERC1967Proxy proxy = new ERC1967Proxy(address(collection), "");

        //initilize proxy's contract storage
        RealEstateNFT(address(proxy)).initialize(defaultAdmin,pauser,minter,upgrader);

        vm.stopBroadcast();
        return address(proxy);
    }
}