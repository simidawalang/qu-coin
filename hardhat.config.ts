import * as dotenv from "dotenv";

import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    rinkeby: {
      url: `${process.env.RINKEBY_URL}`,
      accounts: [`${process.env.PRIVATE_KEY}`],
    },
  },
};

export default config;
