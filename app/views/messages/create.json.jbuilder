json.body @message.body
json.name @message.user.name
json.time @message.created_at.strftime('%Y/%m/%d %T')
json.image @message.image.url
