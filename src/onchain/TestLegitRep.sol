// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title TestLegitRep
 * @dev Simplified version of ReputationRegistry for testnet testing
 * @notice Removes restrictions to allow easy testing with multiple wallets
 */
contract TestLegitRep {
        // Constants for reputation calculations
    uint256 public constant MAX_REPUTATION = 1000;
        uint256 public constant MIN_REPUTATION = 0;
    uint256 public constant INITIAL_REPUTATION = 500;
    string private info = "Version 0.0.0";


    // Simplified struct
    struct ReputationData {
        uint256 score;
        uint256 totalRatings;
        bool isRegistered;
    }

    // Mappings
    mapping(address => ReputationData) private _reputations;

    // State Variables
        address[] private _registeredUsers;

    // Events
    event UserRegistered(address indexed user, uint256 initialReputation);
    event ReputationUpdated(address indexed user, uint256 oldScore, uint256 newScore, address indexed rater);

    /**
     * @dev Register a new user (anyone can call)
     * @param user Address of the user to register
     */
    function registerUser(address user) public {
        // Allow re-registration for testing
        if (!_reputations[user].isRegistered) {
            _registeredUsers.push(user);
        }

        _reputations[user] = ReputationData({score: INITIAL_REPUTATION, totalRatings: 0, isRegistered: true});

        emit UserRegistered(user, INITIAL_REPUTATION);
    }
}