const WRP = artifacts.require('Wrapper');
module.exports = async function (deployer, network, accounts) {

  let FROM_DEPLOYER = {from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'};

  await deployer.deploy(WRP, FROM_DEPLOYER);
  let wrapper = await WRP.deployed();
  console.log(`wrapper.address: ${wrapper.address}`);

  let res = await wrapper.calcGas({from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'});

  //================================================================================//

  //console.log(JSON.stringify(res,null,2));

  if(res.logs.filter( item => item.event === 'Success').length >0){
    console.log(`gas used less than: ${res.logs["0"].args.gasUsed.toString()}`)
  }

  res = await wrapper.littleTest({from: '0xC2F2D954Bb6296b923BC938c32C4C30A8e39015f'});

  //console.log(JSON.stringify(res,null,2));


  if(res.logs.filter( item => item.event === 'Success').length >0){
    console.log(`little test OK`)
  }else{
    console.log(`little test FAIL!!!!!!!!!!!!!!!!!!!!!!!!!!`);
    console.log(`little test FAIL!!!!!!!!!!!!!!!!!!!!!!!!!!`);
    console.log(`little test FAIL!!!!!!!!!!!!!!!!!!!!!!!!!!`);
    console.log(`little test FAIL!!!!!!!!!!!!!!!!!!!!!!!!!!`);
    console.log(`little test FAIL!!!!!!!!!!!!!!!!!!!!!!!!!!`);
  }
};
