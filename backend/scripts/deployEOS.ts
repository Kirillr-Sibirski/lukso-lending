import { ethers } from 'hardhat';
import * as dotenv from 'dotenv';

dotenv.config();

async function main() {
  // Hardhat has some issues with EIP 1559 settings, so we force it
  // See this issue for more info: https://github.com/NomicFoundation/hardhat/issues/3418
  const { maxFeePerGas, maxPriorityFeePerGas } =
    await ethers.provider.getFeeData();

  const customToken = await ethers.getContractFactory('CustomToken');

  const Token = await customToken.deploy({
    maxFeePerGas,
    maxPriorityFeePerGas,
    type: 2,
  });
  const token = await Token.waitForDeployment();
  const CustomTokenAddress = await token.getAddress();
  console.log(`Token address: ${CustomTokenAddress}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });