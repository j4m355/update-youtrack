passwordHasher = require('password-hash')

HashPassword = (password)->
    return passwordHasher.generate(password)

exports.HashPassword = HashPassword

Verify = (password, hashedPassword)->
    return passwordHasher.verify(password, hashedPassword)

exports.Verify = Verify
