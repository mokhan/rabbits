#!/usr/bin/env ruby
## encoding: utf-8

require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.topic("chitchat")
username = `'whoami'`.chomp!
message = ARGV.empty? ? "Hi!" : ARGV.join(" ")

exchange.publish(message, routing_key: username)
puts " [x] Sent #{username}:#{message}"

connection.close
