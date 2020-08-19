import Web3 from web3;

var Web3 = require('web3');
let web3 = new Web3(Web3.givenProvider || 'ws://127.0.0.1:9545');

let myGame_abi = require('./MyGame_abi.js');
// contact metamask
var address;
address[0] = '0xc5cda2d10eb76f0394a1c4400b474086d3bf71b3';
address[1] = '0x2e62b15162fbcd441e28d1b350bb796747b5f87b';
address[2] = '0x6a701d695f8cb62261cb8168cb8fee342ebcb9d0';
address[3] = '0x675f7522690cfa02591721dea065468250b87f53';



const Contract_MyGame = new web3.eth.Contract(myGame_abi, address[0]);

Contract_MyGame.methods.CreateMyCat("hello_meo_1");

Contract_MyGame.methods.totalSupply().call((err, result) => { console.log(result) });

Contract_MyGame.methods.balanceOf(address[0]).call((err, result) => { console.log(result) });


//or

// var web3 = newWeb3(new Web3.providers.HttpProvider('http://localhost:8545'));

// //change provider
// web3.setProvider('ws://locallhost:8545');
// //or
// web3.setProvider(new Web3.providers.WebsocketProvider('ws://localhost:8546'));

// //using the IPC provider in node.js
// var net = require('net');
// var web3 = new Web3('/Users/myuser/Lirary...');

// var Eth = require('web3-eth');
// var eth = new Eth(Eth.givenProvider || 'ws://127.0.0.1:8545');

// web3.eth.getAccounts(console.log);

// // //or
// // const rpcURL = "https://ropsten.infura.io/v3/38f25ca861bc4967a2a32c308ecea78c";
// // var web3 = new Web3(rpcURL);

// web3.eth.defaultAccount = '0xF97733BC082E09A64e65fAcd77CE9512783AC077';
// //password: 277171608028829cddad4b2fdec4817def79824beb996aa1982ac5c053709f8e
// web3.eth.defaultChain = 'mainnet';
// //or
// web3.eth.defaultChain = 'ropsten';


// //check balances
// web3.eth.getBalance(address, (err, wei) => {
//     balance = web3.utils.fromWei(wei, 'ether')
// })

// web3.eth.defaultCommon = { customChain: { name: 'custom-network', networkId: 1, chainId: 1 }, baseChain: 'mainnet' };
// web3.eth.transactionBlockTimeout