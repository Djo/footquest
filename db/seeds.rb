# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

admin = User.new :first_name => 'John', 
                 :last_name => 'Doe', 
                 :email => 'admin@example.com', 
                 :password => 'password'
                 
admin.role = 'admin'
admin.save                 
                     