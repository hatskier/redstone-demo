describe("Example contract", function () {

  it("Interacting with the example contract", async () => {
    // Deploying
    const ExampleContract = await ethers.getContractFactory("Example");
    const contract = await ExampleContract.deploy();

    // Interacting
    const tx = await contract.setCurrentPrice();
    await tx.wait();
    const isOverpriced = await contract.isOverpriced();
    console.log({ isOverpriced });
    const priceFromContract = await contract.getLastPrice();
    console.log({ priceFromContract: priceFromContract.toNumber() });
  });
});
