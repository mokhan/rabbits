#!/env ruby
# encoding: utf-8

require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue("hello")

puts " [*] Waiting for messages in #{queue.name}. To exit press CTRL+C"
queue.subscribe(ack: true, block: true) do |delivery_info, properties, body|
  puts " [x] Received #{body}"
  sleep body.count(".").to_i
  puts " [x] Done"
  channel.ack(delivery_info.delivery_tag)
end
