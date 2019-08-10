# Test Contract: Relay

This is a small proof-of-concept that will help Microsponsors upgrade its Registry smart contract in the future. The Relay contract here shows how a new version of the Registry could query and edit the "old" original version of the Registry on-chain. This will be useful when we need to upgrade to the new  0x Exchange contract version 3.


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
> r.dr()
outputs deployed registry contract (set in migrations/2_deployed_contracts.js)
> r.isWhitelisted("0xB9E652B8Da207a40B7E7CcB404FEEC95A4b8CFAF")
true
```
