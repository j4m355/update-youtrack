settings = require(__dirname + '/functions/config')
_ = require('underscore')
request = require('superagent')
exec = require('child_process').exec


exec('git log -1 HEAD --format=format:%s%n%b', (err, commit, stderr)->
	splitCommit = commit.split(" ")
	issue = splitCommit[0].substring(1)
	status = splitCommit[1].trim()

	console.log "issue: " + issue
	console.log "status: " + status

	youtrackUrl = settings.get("youtrack-url")
	youtrackUser = settings.get("userSettings:user")
	youtrackPassword = settings.get("userSettings:pass")
	apiBase = '/rest'
	contentType = "application/x-www-form-urlencoded"
	accept = "application/json"
	commandString = "State " + status


	request
		.post(youtrackUrl + apiBase + '/user/login')
		.send({login : youtrackUser})
		.send({password : youtrackPassword})
		.set("Accept" : accept)
		.set("Content-type" : contentType)
		.end((res)->
			console.log "Login status: " + res.status
			cookie = res.header['set-cookie']
			request
				.post(settings.get('youtrack-url') + apiBase + "/issue/" + issue + "/execute" )
				.send({command : commandString})
				.set('Cookie', cookie)
				.set("Accept" : contentType)
				.set("Content-type" : contentType)
				.end((res)->
					console.log "bug update status: " + res.status
					)
			)
	)

