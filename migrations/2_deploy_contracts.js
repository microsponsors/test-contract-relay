const Relay = artifacts.require("Relay");

module.exports = function(deployer) {
  // Second arg is the address of the original Microsponsors Registry
  // contract to forward the delegate call to:
  deployer.deploy(Relay, "0xB80909063f01fFD358f2dEacF663FB8F38DeDe9F");
};
