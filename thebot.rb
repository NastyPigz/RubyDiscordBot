require 'discordrb'

def bot
  bot = Discordrb::Commands::CommandBot.new token: ENV['token'], client_id: 863127922206441472, prefix: 'rb!'

  bot.message(with_text: "<@#>") do |event|
      event.respond "Hello, #{event.user.mention}! My prefix is **`rb!`**"
  end
  bot.message(with_text: "<@!#>") do |event|
      event.respond "Hello, #{event.user.mention}! My prefix is **`rb!`**"
  end

  bot.command(:server, description: "Gets some server info.") do |event|
      event.respond "Server name: #{event.server.name}\nServer ID: #{event.server.id}\nServer region: #{event.server.region}\n"
  end

  bot.command(:ping, description: "Get the bots latency") do |event|
      m = event.respond('Pinging...')
      m.edit "Pong! Took #{Time.now - event.timestamp} seconds."
  end

  bot.command(:invite, description: 'Get the invite url') do |event|
      event.bot.invite_url
  end

  bot.command(:exit, help_available: false) do |event|
      break unless event.user.id == 583745403598405632 

      bot.send_message(event.channel.id, 'Bot is shutting down')
      exit
  end

  bot.run
end
