const { WrapperBuilder } = require("redstone-flash-storage");

describe("Example contract", function () {

  it("Interacting with the example contract", async () => {
    // Deploying
    const ExampleContract = await ethers.getContractFactory("Example");
    const contract = await ExampleContract.deploy();
    const wrappedContract = WrapperBuilder
                              .wrapLite(contract)
                              .usingPriceFeed("redstone-stocks", "TSLA");
    await wrappedContract.authorizeProvider();

    // Interacting
    const tx = await wrappedContract.setCurrentPrice();
    await tx.wait();
    const isOverpriced = await wrappedContract.isOverpriced();
    console.log({ isOverpriced });
    const priceFromContract = await wrappedContract.getLastPrice();
    console.log({ priceFromContract: priceFromContract.toNumber() / 10 ** 8 });
  });
});
