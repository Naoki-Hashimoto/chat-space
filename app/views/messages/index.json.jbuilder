json.array! @messages do |message|
  json.name message.user.name
  json.time message.created_at
  json.body message.body
  json.image message.image.to_s
end
