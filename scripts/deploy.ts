import hre from 'hardhat'

async function main() {
  // 获取合约文件
  const Token = await hre.ethers.getContractFactory("QtumToken");
  // 获取合约部署的对象
  const token = await Token.deploy();
  // 执行部署
  await token.deployed();
  // 打印一下部署的结果
  console.log("token deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
