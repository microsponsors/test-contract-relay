const Relay = artifacts.require("Relay");

module.exports = function(deployer) {
  deployer.deploy(Relay);
};
