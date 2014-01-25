nconf = require('nconf')
fs = require('fs')

###
To keep settings private store them in _settings.json - these are in the .gitignore. settings.json is just for reference and should be maintained by hand
You dont have to use _settings and can just use the included settings.json if you arent storing sensitive data
###

settings = (->
    realSettings = (__dirname + "/../config/_settings.json")
    publicSettings = (__dirname + "/../config/settings.json")
    if fs.existsSync(realSettings)
        nconf.use 'file', file: realSettings
    else
        nconf.use 'file', file: publicSettings    
    nconf.load()
    nconf)()
module.exports = settings
        



