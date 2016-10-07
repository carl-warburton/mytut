# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Removing existing #{Role.all.count} roles"
Role.destroy_all

p "Creating 3 roles"
roles = [:student, :tutor, :admin]
roles.each do |role|
  Role.create(name: role)
end

@password = "123456"

#admin
user1 = User.create(email:"first@example.com", password:@password, password_confirmation:@password,
          first_name:"first", last_name:"Admin", phone_number: "1"*10 )
user1.add_role :admin
# first tutor
user2= User.create(email:"second@example.com", password:@password, password_confirmation:@password,
          first_name:"second", last_name:"Smith", phone_number: "2"*10 )
user2.add_role :tutor
# second tutor
user3 = User.create(email:"third@example.com", password:@password, password_confirmation:@password,
          first_name:"third", last_name:"Jones", phone_number: "3"*10 )
user3.add_role :tutor
# first student
user4 = User.create(email:"fourth@example.com", password:@password, password_confirmation:@password,
          first_name:"fourth", last_name:"Jess", phone_number: "4"*10 )
user4.add_role :student
# second student
user5 = User.create(email:"fifth@example.com", password:@password, password_confirmation:@password,
          first_name:"third", last_name:"Xavier", phone_number: "5"*10 )
user5.add_role :student

# first tutor profile
TutorProfile.create( description: "I have been passionate about teaching for the past...",
                            subject: "Mathematics, Physics", subject_year: "10, 11 and 12",
                            rates: "$30/hr", experience: "Teaching at all universities in the world.",
                            qualifications: "10 PHDs: 5 in Physics, 4 in Mathematics and the la...", user_id: 2)

# second tutor profile
TutorProfile.create( description: "My name is Smith. I can teach English at different levels.
                            Passionate and would do all I can so that you reach you goal",
                            subject: "English", subject_year: "7,8,9,10,11,12",
                            rates: "$30/hr", experience: "Teaching to more than 50 highschool students.",
                            qualifications: "Bachelor in Arts and Education", user_id: 3)
