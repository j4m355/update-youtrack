mongoose = require("mongoose")
settings = require(__dirname + '/config') 

database = (->
    console.log "host: " +  settings.get("database:host")
    console.log "db name: " +  settings.get("database:name")
    mongoose.connect settings.get("database:host"), settings.get("database:name")
    mongoose)()
module.exports = database