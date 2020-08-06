const IERC20 = artifacts.require("IERC20");
const ERC20 = artifacts.require("ERC20");
const MYCAT = artifacts.require("MYCAT");
const SafeMath = artifacts.require("SafeMath");

module.exports = function(deployer) {
    deployer.deploy(ERC20);
    deployer.link(ERC20, IERC20);
    deployer.link(ERC20, MYCAT);
    deployer.deploy(SafeMath);
};