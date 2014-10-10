#!/usr/bin/env ruby
## encoding: utf-8

require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.fanout("logs")
queue = channel.queue("", exclusive: true)

queue.bind(exchange)

puts " [*] Waiting for logs. To exit press CTRL+C"

begin
  queue.subscribe(block: true) do |delivery_info, properties, body|
    puts " [x] #{body}"
  end
rescue Interrupt => _
  channel.close
  connection.close
end
