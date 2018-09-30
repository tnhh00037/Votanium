require('babel-register')

module.exports = {
  networks: {
    ganache: {
      host: '127.0.0.1',
      port: 8545,
      network_id: '*',
      gas: 470000
    }
  }
}