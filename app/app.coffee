settings = require(__dirname + '/functions/config')
_ = require('underscore')
request = require('superagent')
exec = require('child_process').exec

try
	exec('git log -1 HEAD --format=format:%s%n%b', (err, commit, stderr)->
		if commit[0] is "#"
			splitCommit = commit.split(" ")
			issue = splitCommit[0].substring(1)
			status = splitCommit[1].trim()

			console.log "issue: " + issue
			console.log "status: " + status

			youtrackUrl = settings.get("youtrack-url")
			console.log "youtrackurl: " + youtrackUrl
			youtrackUser = settings.get("userSettings:user")
			console.log "youtrackuser: " + youtrackUser
			youtrackPassword = settings.get("userSettings:pass")
			console.log "youtrackpassword: " youtrackPassword
			apiBase = '/rest'
			contentType = "application/x-www-form-urlencoded"
			accept = "application/json"
			commandString = "State " + status


			request
				.post(youtrackUrl + apiBase + '/user/login')
				.send({login : youtrackUser})
				.send({password : youtrackPassword})
				.set("Accept", accept)
				.set("Content-type", contentType)
				.end((res)->
					console.log "Login status: " + res.status
					cookie = res.header['set-cookie']
					request
						.post(youtrackUrl + apiBase + "/issue/" + issue + "/execute" )
						.send({command : commandString})
						.set('Cookie', cookie)
						.set("Accept", accept)
						.set("Content-type", contentType)
						.end((res)->
							debugger
							console.log "bug update status: " + res.status
							)
					)
		)
catch e