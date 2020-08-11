const IERC20 = artifacts.require("IERC20");
const MyGame = artifacts.require("MyGame");
const MYCAT = artifacts.require("MYCAT");
const SafeMath = artifacts.require("SafeMath");
const ERC20Cappe = artifacts.require("ERC20Cappe");
const Context = artifacts.require("Context");

module.exports = function(deployer) {
    deployer.deploy(MyGame);
    deployer.deploy(SafeMath);
    deployer.deploy(ERC20Cappe);
    deployer.deploy(Context);
    deployer.deploy(IERC20);
    deployer.deploy(MYCAT);
    deployer.link(MyGame, SafeMath);

};