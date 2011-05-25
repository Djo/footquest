Factory.define :user do |f|
  f.first_name 'John'
  f.last_name 'Doe'
  f.password 'password'
  f.email { Factory.next(:email) }
end  

Factory.define :quest do |f|
  f.title 'Quest'
  f.description 'Description'
  f.meeting_place 'High Street'
  f.meeting_at DateTime.new
  f.start_at { |f| f.meeting_at + 1.hour }
end  

Factory.sequence :email do |n|
  "email#{n}@example.com"
end