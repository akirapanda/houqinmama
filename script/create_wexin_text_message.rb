text_message = WeixinTextMessage.new
text_message.save

event_message = WeixinEventMessage.new
event_message.save

messages = WeixinMessage.all

puts messages.size