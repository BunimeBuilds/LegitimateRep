// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/onchain/TestLegitRep.sol";

/**
 * @title DeployTestLegitRep
 * @dev Foundry deployment script for TestLegitRep
 */
contract DeployTestLegitRep is Script {
    function run() external returns (TestLegitRep) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        // Deploy the contract
        TestLegitRep testLegitRep = new TestLegitRep();

        console.log("TestLegitRep deployed to:", address(testLegitRep));

        // Optional: Register the deployer automatically
        testLegitRep.registerSelf();
        console.log(
            "Deployer registered with initial reputation:", testLegitRep.getReputation(vm.addr(deployerPrivateKey))
        );

        vm.stopBroadcast();

        return testLegitRep;
    }
}