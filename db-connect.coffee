_Coal = require 'coal'
_config = require('./config')

_coal = new _Coal(_config.db, _config.develop)
exports.conn = -> _coal