var Voting = artifacts.require('./Votanium.sol')

module.exports = function (deployer) {
  deployer.deploy(Voting,['Rama', 'Nick', 'Jose','Donald Trump','Hillary Clinton'],"0xabac645504ccfa73265a1668feeded64f48c5f14","0xc67da389853b1efda8aa67b91d3244502eff38ad")
}
