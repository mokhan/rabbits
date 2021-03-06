#!/usr/bin/env ruby
## encoding: utf-8

require "bunny"

connection = Bunny.new(host: ENV.fetch('RABBIT_HOST', 'localhost'))
connection.start

me = `whoami`.chomp!
channel = connection.create_channel
exchange = channel.topic("chitchat")
queue = channel.queue(me, exclusive: true)

ARGV.push('#') if ARGV.empty?
ARGV.each do |username|
  queue.bind(exchange, routing_key: username)
end

puts " [*] Waiting for gossip from #{ARGV}. To exit press CTRL+C"

begin
  queue.subscribe(block: true) do |delivery_info, properties, body|
    puts " [x] #{delivery_info.routing_key}:#{body}"
    message = "#{delivery_info.routing_key} says #{body}"
    system("say '#{message}'")
  end
rescue Interrupt => _
  channel.close
  connection.close
end
