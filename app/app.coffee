settings = require(__dirname + '/functions/config')
_ = require('underscore')
request = require('superagent')
exec = require('child_process').exec


exec('git log -1 HEAD --format=format:%s%n%b', (err, commit, stderr)->
	console.log commit
	splitCommit = commit.split(" ")
	issue = splitCommit[0].substring(1)
	status = splitCommit[1].trim()

	console.log "issue: " + issue
	console.log "status: " + status

	commandString = "State " + status

	request
		.post(settings.get("youtrack-url") + '/rest/user/login')
		.send({login : settings.get("userSettings:user")})
		.send({password : settings.get("userSettings:pass")})
		.set("Accept" : "application/json")
		.set("Content-type" : "application/x-www-form-urlencoded")
		.end((res)->
			console.log "Login status: " + res.status
			request
				.post(settings.get('youtrack-url') + "/rest/issue/" + issue + "/execute" )
				.send({command : commandString})
				.set('Cookie', res.header['set-cookie'])
				.set("Accept" : "application/json")
				.set("Content-type" : "application/x-www-form-urlencoded")
				.end((res)->
					console.log "bug update status: " + res.status
					)
			)
	)

