path = require 'path'
module.exports =
  cwd: path.join __dirname, 'biz'
  baseUrl: '/api'
  map: [
    {
      path: '/login'
      biz: 'login'
      method: put: false
    }
  ]