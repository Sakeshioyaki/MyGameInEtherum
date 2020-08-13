//const IERC20 = artifacts.require("IERC20");
const MyGame = artifacts.require("MyGame");
//const MYCAT = artifacts.require("MYCAT");
const SafeMath = artifacts.require("SafeMath");
const ERC20Capped = artifacts.require("ERC20Capped");
//const Context = artifacts.require("Context");

module.exports = function(deployer) {
    deployer.deploy(MyGame);
    deployer.link(MyGame, SafeMath);
    deployer.deploy(ERC20Capped, 100000000);
    // deployer.deploy(MYCAT);
};