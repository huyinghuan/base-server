_path = require 'path'
_conn = require('../db-connect').conn()
isDev = require("../config").develop

class BaseBean
  constructor: ->
    @conn = _conn
    @setTableName(__filename)
    @init()

  init: ->
    throw new Error('cannot find table') if @tableName is null
    @table = @conn.Model(@tableName, isDev)

  getTable: -> @table

  setTableName: (fileName)->
    baseName = _path.basename(fileName)
    extName = _path.extname(baseName)
    @tableName = baseName.replace extName, ""

  save: (data)->
    data.status = 1
    @table.save(data)

  find: (fields, where)-> @table.find(fields, where)

  findOne: (fields, where)-> @table.findOne(fields, where)

  delOne: (key, value)->
    @update({status: 0}, [key, "=", value])
    #@table.delOne(key, value)

  delMul: (key, arr)-> @table.delMul(key, arr)

  sql: (sqlStr)-> @table.sql(sqlStr)

  update: (data, where)-> @table.update(data, where)

module.exports  = BaseBean