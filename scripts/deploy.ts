import { ethers } from "hardhat";

async function main() {

  const TXOriginTest = await ethers.getContractFactory("TXOriginTest");
  const TXOriginTestContract = await TXOriginTest.deploy();
  await TXOriginTestContract.deployed();


  const Attack = await ethers.getContractFactory("Attack");
  const AttackContract = await Attack.deploy(TXOriginTestContract.address);
  await AttackContract.deployed();


  console.log(await TXOriginTestContract.getResult());
  //await AttackContract.callOriginWithSize(TXOriginTestContract.address);


}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
