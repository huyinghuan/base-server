Base = require('water-pit').Base

class Login extends Base
  constructor: ->

  get: (req, resp, next)->
    resp.send("hello world")

module.exports = new Login()