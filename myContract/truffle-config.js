//const HDWalletProvider = require("@truffle/hdwallet-provider");
//const mnemonic = "jeans crowd arrow pair little chief stand wagon muscle birth oblige chronic";
module.exports = {
    networks: {
        development: {
            host: "127.0.0.1",
            port: 8545,
            network_id: "*", // Match any network id
            gas: 5000000
        }
    },
    compilers: {
        solc: {
            version: '0.7.0',
        }
    },
    // ropsten: {
    //     provider: function() {
    //         return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/c1f678a8bf994141a272a7cb607316ff")
    //     },
    //     network_id: 3,
    //     gas: 3000000,
    //     gasPrice: 21

    // }
};