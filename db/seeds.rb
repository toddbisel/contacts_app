# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# contact = Contact.new(
#   first_name: "Jim",
#   last_name: "Thorpe",
#   email: "jimthorpe@gmail.com",
#   phone_number: "5154326595"
# )

# contact.save

100.times do 

  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  middle_name = Faker::Name.unique.middle_name
  
  contact = Contact.new(
    first_name: first_name,
    last_name: last_name,
    middle_name: middle_name,
    email: "#{first_name}.#{last_name}@gmail.com",
    phone_number: Faker::PhoneNumber.cell_phone,
    user_id: rand(1..2)
  )
  contact.save
end