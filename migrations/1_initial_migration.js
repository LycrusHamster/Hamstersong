const Migrations = artifacts.require('Migrations');

module.exports = async function (deployer, network, accounts) {

  let FROM_DEPLOYER = {from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'};

  await deployer.deploy(Migrations, FROM_DEPLOYER);
};
