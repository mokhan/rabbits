#!/usr/bin/env ruby
## encoding: utf-8

require "bunny"

if ARGV.empty?
  ARGV.push('#')
end

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.topic("chitchat")
queue = channel.queue("", exclusive: true)

ARGV.each do |username|
  queue.bind(exchange, routing_key: username)
end

puts " [*] Waiting for gossip. To exit press CTRL+C"

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
