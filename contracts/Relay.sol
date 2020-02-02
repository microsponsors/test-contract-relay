pragma solidity ^0.5.5;
pragma experimental ABIEncoderV2;


// Deployed Registry contract ABI
// We just the signatures of the parts we need to interact with:
contract DeployedRegistry {
    function isContentIdRegisteredToCaller(uint32 federationId, string memory contentId) public view returns(bool);
    function isMinter(uint32 federationId, address account) public view returns (bool);
    function isAuthorizedTransferFrom(uint32 federationId, address from, address to, uint256 tokenId, address minter, address owner) public view returns(bool);
}


contract Relay {

    address public owner;
    mapping (uint32 => address) public federationIdToRegistryAddress;


    constructor(address initAddr)
        public
    {

        owner = msg.sender;

    }

    function update(uint32 federationId, address newAddress) public {

        require(msg.sender == owner, 'NOT_AUTHORIZED');

        federationIdToRegistryAddress[federationId] = newAddress;

    }


    function isContentIdRegisteredToCaller(
        uint32 federationId,
        string memory contentId
    )
        public
        view
        returns (bool)
    {

        // Checks mapped Registry contract:
        DeployedRegistry dr = DeployedRegistry(federationIdToRegistryAddress[federationId]);

        // Call upstream fn:
        return dr.isContentIdRegisteredToCaller(federationId, contentId);

    }

    function isMinter(
        uint32 federationId,
        address account
    )
        public
        view
        returns (bool)
    {

        // Checks mapped Registry contract:
        DeployedRegistry dr = DeployedRegistry(federationIdToRegistryAddress[federationId]);

        // Call upstream fn:
        return dr.isMinter(federationId, account);

    }

    function isAuthorizedTransferFrom(
        uint32 federationId,
        address from,
        address to,
        uint256 tokenId,
        address minter,
        address owner
    )
        public
        view
        returns (bool)
    {

        // Checks mapped Registry contract:
        DeployedRegistry dr = DeployedRegistry(federationIdToRegistryAddress[federationId]);

        // Call upstream fn:
        return dr.isAuthorizedTransferFrom(federationId, from, to, tokenId, minter, owner);

    }

}
