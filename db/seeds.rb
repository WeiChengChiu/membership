puts 'Starting db seeds'
puts "尋找或創建 admin帳號: test01@gmail.com"

email = 'test01@gmail.com'
password = 12345678
encrypted_password = '$2a$11$QLCMeo1GdauKV7RoZiza4uy5voXYHgpNE0Yhwi8fPGi187wo9P2cq'

user = User.find_by(email: email)
unless user
  user = User.new(
    email: email,
    password: password,
    password_confirmation: password,
    role: 'admin'
  )
  user.save!
  user.encrypted_password = encrypted_password
  user.save
end

puts "可以使用admin帳號: test01@gmail.com, 密碼: 12345678"
