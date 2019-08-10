pragma solidity ^0.5.5;
pragma experimental ABIEncoderV2;


// Copy of old original Deployed Registry contract ABI
// We just the signatures of the parts we need to interact with:
contract DeployedRegistry {

    mapping (address => bool) public isWhitelisted;

}

contract Relay {

    DeployedRegistry public dr;
    address public owner;

    // Initialize the Relay by passing address of original Deployed Registry
    // See `/migrations/2_deploy_contracts.js`
    constructor(address initAddr)
        public
    {

        dr = DeployedRegistry(initAddr);
        owner = msg.sender;

    }

    function update(address newAddress)
        public
    {
        require(msg.sender == owner, 'NOT_AUTHORIZED');
        dr = DeployedRegistry(newAddress);
    }


    function isWhitelisted(address target)
        public
        view
        returns (bool)
    {

        // Checks original Registry contract for whitelisted status:
        return dr.isWhitelisted(target);

    }

}
