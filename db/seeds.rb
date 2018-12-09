puts 'Starting db seeds'

def find_or_create_account(account_name)
  puts "尋找或創建 #{account_name}帳號: #{account_name}01@gmail.com"

  email = "#{account_name}01@gmail.com"
  password = 12345678
  encrypted_password = '$2a$11$QLCMeo1GdauKV7RoZiza4uy5voXYHgpNE0Yhwi8fPGi187wo9P2cq'

  user = User.find_by(email: email)
  unless user
    user = User.new(
      email: email,
      password: password,
      password_confirmation: password,
      role: account_name == 'admin' ? 'admin' : nil
    )
    user.save!
    user.encrypted_password = encrypted_password
    user.save
  end

  puts "可以使用#{account_name}n帳號: #{account_name}01@gmail.com, 密碼: 12345678"
end

find_or_create_account('admin')
find_or_create_account('user')
