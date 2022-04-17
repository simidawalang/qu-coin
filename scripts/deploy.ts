import { ethers } from "hardhat";

const deploy = async () => {
  const [owner] = await ethers.getSigners();

  const QuCoinFactory = await ethers.getContractFactory("QuCoin");
  const QuCoinContract = await QuCoinFactory.deploy();

  await QuCoinContract.deployed();

  console.log("QuCoin deployed to: ", QuCoinContract.address);
  console.log("Owned by: ", owner.address);
};

deploy()
  .then(() => {
    process.exitCode = 0;
  })
  .catch((e) => {
    console.error(e.message);
    process.exitCode = 1;
  });
