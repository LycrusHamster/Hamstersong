const B2B = artifacts.require('HasmterBlake2b');
module.exports = async function (deployer, network, accounts) {

  let FROM_DEPLOYER = {from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'};

  await deployer.deploy(B2B, FROM_DEPLOYER);
  let b2b = await B2B.deployed();
  console.log(`b2b.address: ${b2b.address}`);

  let res = await b2b.test208({
    from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'
  })
  //================================================================================//

  console.log(JSON.stringify(res,null,2));

};
