nodemailer = require("nodemailer")
settings = require(__dirname + '/config')

emailSettings = settings.get("email:settings")
mailContent = settings.get("email:emailContent")

transport = nodemailer.createTransport("SMTP", emailSettings)

SendMail =  (email, cb)->
	unless email.to is undefined then mailContent.to = email.to
	unless email.from is undefined then mailContent.from = email.from
	unless email.subject is undefined then mailContent.subject = email.subject
	unless email.text is undefined then mailContent.text = email.text
	
	transport.sendMail(mailContent, (error, responseStatus)->
		if error
			cb(error)
		else
			cb(200)
		)

exports.SendMail = SendMail