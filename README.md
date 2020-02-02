# Test Contract: Federation Relay Bridge

This is a small proof-of-concept that will help Microsponsors federate and/or upgrade its own [Registry smart contract](https://github.com/microsponsors/registry-contract) in the future.

The basic concept:

- Each Microsponsors Federation member will have its own Registry contract that implements its own authorization rules as well (as its own account registration data).
- Transfer restrictions are currently implemented on the Microsponsors ERC-721 contract by pointing directly at the (only) public Microsponsors `registry()` address for authorization checks (it contains a DeployedRegistry ABI to help it query the Registry).
- To federate, we can simply deploy the contract in this repo and point the ERC-721 public `registry()` setting to it via `updateRegistryAddress()`. This contract resolves each `federationId` to the corresponding Registry address mapped for that member.
- To add each new member to the Federation, the Microsponsors admin calls `update(<federationId>, <newAddress>)` on this contract.
- _NOTE_: The original Microsponsors registry should always be set to `federationId=1` 1 so the ERC-721 tokens minted up to this point will resolve to the correct (original) registry!


## Build & Deploy
Run ganache-cli: `$ ganache-cli -p 8545`
In another terminal:
```
$ rm -rf build && truffle migrate --reset --compile-all
```

### Versioning
This stack seems to be sensitive to versioning, so capturing details here:

* truffle v5.0.21
* ganache-cli v6.4.3
* solc compiler 0.5.5, specified in truffle-config.js


## Test
```
$ truffle console --network development
> Relay.deployed().then(inst => { r = inst})
> r.update(1, <address>)
```
