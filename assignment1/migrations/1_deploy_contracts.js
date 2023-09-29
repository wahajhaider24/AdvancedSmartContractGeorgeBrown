const wahajBridgeGor = artifacts.require("wahajBridgeGor");
const wahajBridgeSep = artifacts.require("wahajBridgeSep");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(wahajBridgeGor,accounts[0] )
  
  
  deployer.deploy(wahajBridgeSep, accounts[0])
}
