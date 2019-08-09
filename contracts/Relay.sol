pragma solidity ^0.5.5;
pragma experimental ABIEncoderV2;


// Copy of Deployed Registry contract ABI
// We just the signatures of the parts we need to interact with:
contract DeployedRegistry {

    mapping (address => bool) public isWhitelisted;

}

contract Relay {

    DeployedRegistry public dr;
    address public owner;

    // Initialize the Relay by passing address of on-chain Deployed Registry
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

        return dr.isWhitelisted(target);

    }

    // TODO: Bonus points
    // I think this is the pattern to use for sending a state change to deployed contract
    // Not just reading a value; I don't think we'll need to do this, but leaving this
    // here just in case.
    // From: https://ethereum.stackexchange.com/questions/73455/delegatecall-return-values-solidity-5-0?rq=1
    // function updateStatus(address target)
    //     public
    //     returns (bool)
    // {

    //     bytes memory data = abi.encodeWithSelector(bytes4(keccak256("updateStatus(address)")), target);
    //     (bool success, bytes memory returnedData) = dr.delegatecall(data);
    //     require(success);
    //     return abi.decode(returnedData, (bool));
    // }

}
