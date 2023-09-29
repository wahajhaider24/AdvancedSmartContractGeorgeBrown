const wahajBridgeGor = artifacts.require("wahajBridgeGor");

contract("wahajBridgeGor", (accounts) => {
  let bridgeInstance;

  const owner = accounts[0];
  const user1 = accounts[1];
  const user2 = accounts[2];

  beforeEach(async () => {
    // Deploy the wahajBridgeGor contract
    bridgeInstance = await wahajBridgeGor.new(owner, { from: owner });
  });

  it("should allow users to deposit tokens", async () => {
    const depositAmount = web3.utils.toWei("1", "ether");

    // User1 deposits tokens
    await bridgeInstance.deposit(depositAmount, { from: user1 });

    // Check the contract's balance
    const contractBalance = await bridgeInstance.tokenBalance();
    assert.strictEqual(contractBalance.toString(), depositAmount, "Contract balance is incorrect");

    // You can add more assertions as needed
  });

  it("should allow users to claim tokens", async () => {
    const depositAmount = web3.utils.toWei("1", "ether");

    // User1 deposits tokens
    await bridgeInstance.deposit(depositAmount, { from: user1 });

    // User1 claims tokens
    const initialUser1Balance = await web3.eth.getBalance(user1);
    const withdrawalId = 0; // Assuming this is how you get the withdrawal ID
    await bridgeInstance.claim(user1, depositAmount, withdrawalId, { from: user1 });

    // Check user1's balance after claiming
    const finalUser1Balance = await web3.eth.getBalance(user1);
    const expectedBalance = web3.utils
      .toBN(initialUser1Balance)
      .add(web3.utils.toBN(depositAmount))
      .toString();
    assert.strictEqual(finalUser1Balance.toString(), expectedBalance, "User1's balance is incorrect after claiming");

    
  });



});