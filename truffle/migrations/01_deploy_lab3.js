const lab3 = artifacts.require("lab3");

module.exports = function (deployer) {
  // Deploy MyContract
  deployer.deploy(lab3);
};