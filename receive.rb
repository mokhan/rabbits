#!/env ruby
# encoding: utf-8

require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel
queue = channel.queue("hello")

puts " [*] Waiting for messages in #{queue.name}. To exit press CTRL+C"
queue.subscribe(block: true) do | delivery_info, properties, body|
  puts " [x] Received #{body}"
  # cancel the consumer to exit
  delivery_info.consumer.cancel
end

