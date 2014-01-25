mongoose = require('mongoose')
Schema = mongoose.Schema
Mixed = mongoose.SchemaTypes.Mixed

Logger = new Schema(
  date: Date
  url: String
  method: String
  eventDetails: Mixed
  requestBody: Mixed
)
module.exports = mongoose.model('Logger', Logger)