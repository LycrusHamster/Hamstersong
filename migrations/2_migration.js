const ESH = artifacts.require('EaglesongHamster');
const FS = require('fs')
module.exports = async function (deployer, network, accounts) {

  let FROM_DEPLOYER = {from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'};

  await deployer.deploy(ESH, FROM_DEPLOYER);
  let esh = await ESH.deployed();
  console.log(`esh.address: ${esh.address}`);

  let res = await esh.sendTransaction({
    from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f',
    data: '0xaa6d7de46162636465666768696a6b6c6d6e6f707172737475767778797a303132333435363738396162636465666768696a6b6c'
  })
  //================================================================================//

  //console.log(JSON.stringify(res.logs,null,2));
  FS.writeFileSync("debug.log.json",JSON.stringify(res.logs,null,2),{
    flag:"w"
  });
};
