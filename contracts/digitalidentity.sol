// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract IdentityVerification {
    struct Identity {
        string name;
        bool verified;
        uint256 timestamp;
    }

    address public owner;
    mapping(address => Identity) public identities;

    event IdentityRegistered(address indexed user, string name);
    event IdentityVerified(address indexed user);
    event IdentityRevoked(address indexed user);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerIdentity(string memory name) public {
        identities[msg.sender] = Identity(name, false, block.timestamp);
        emit IdentityRegistered(msg.sender, name);
    }

    function verifyIdentity(address user) public onlyOwner {
        identities[user].verified = true;
        emit IdentityVerified(user);
    }

    function revokeIdentity(address user) public onlyOwner {
        identities[user].verified = false;
        emit IdentityRevoked(user);
    }

    function getIdentity(address user) public view returns (string memory, bool, uint256) {
        Identity memory identity = identities[user];
        return (identity.name, identity.verified, identity.timestamp);
    }
}
