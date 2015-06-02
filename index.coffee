_path = require 'path'
_config = require './config'
_bodyParser = require 'body-parser'
_multer = require 'multer'

_Waterpit = require('water-pit').Waterpit
#路由映射
_RouterMap = require('./router')

express = require 'express'
express_session = require 'express-session'


app = express()

app.use express_session({ secret: 'game-path-v1.0', cookie: { maxAge: 1000 * 60 * 60 * 24 }})
app.use _bodyParser.json()
app.use _bodyParser.urlencoded extended: true
app.use _multer()

router = express.Router()

water = new _Waterpit(router, _RouterMap)

app.use '/', router

app.listen _config.port