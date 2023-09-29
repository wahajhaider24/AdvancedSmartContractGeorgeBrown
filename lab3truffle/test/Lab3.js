const Lab3 = artifacts.require("Lab3");

contract("Lab3", (accounts) => {
  let lab3instance;

  const owner = accounts[0];

  const borrower = accounts[1];
  const depositAmount = web3.utils.toWei("1", "ether");
  const borrowAmount = web3.utils.toWei("0.1", "ether");

  before(async () => {
    lab3instance  = await Lab3.deployed();
  });

  it("should allow the owner to deposit Ether", async () => {
    await lab3instance.deposit({ from: owner, value: depositAmount });
    const lab3 = await lab3instance.getContractBalance();
    assert.equal(lab3.toString(), depositAmount, "Deposit failed");
  });

 
});