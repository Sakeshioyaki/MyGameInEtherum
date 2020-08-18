const MyGame = artifacts.require("MyGame");
const PET = artifacts.require("PET");
const SafeMath = artifacts.require("SafeMath");
const ERC20Capped = artifacts.require("ERC20Capped");

module.exports = function(deployer) {
    deployer.deploy(SafeMath);
    deployer.deploy(MyGame);
    deployer.deploy(ERC20Capped, 100000000); //th co tham so 
    deployer.deploy(PET);
    deployer.link(MyGame, SafeMath);
};