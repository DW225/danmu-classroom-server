require 'line/bot'
require 'line/format'

# set channel secret and token
Rails.application.config.line_bot = {
  channel_secret: ENV['LINE_CHANNEL_SECRET'],
  channel_token: ENV['LINE_CHANNEL_TOKEN']
}
