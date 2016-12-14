5.times do |index|
 User.create(
   email: Faker::Internet.safe_email,
   #email: Faker::Internet.email,
   #password: Faker::Internet.password(20),
   password: '123456',
   address: Faker::Address.city,
   phone: Faker::PhoneNumber.phone_number,
   name_company: Faker::Company.name,
   reset_password_token: Faker::Internet.password(8),
   reset_password_sent_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
   remember_created_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
   sign_in_count: Faker::Number.between(0, 1000),
   current_sign_in_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
   last_sign_in_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
   current_sign_in_ip: Faker::Internet.ip_v4_address,
   last_sign_in_ip: Faker::Internet.ip_v4_address,
   )
end
