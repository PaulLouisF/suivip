# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Deleting existing #{User.count} users ..."
User.destroy_all

puts "Creating new users ..."

malagasy_cities = ["Tananarive", "Tuléar", "Antsirabé","Fianarantsoa","Toamasina","Tamatave"]
malagasy_first_names = ["Johary","Tsiry","Fialy","Fetinaty","Andry","Didier"]
malagasy_last_names = ["Rajoelina","Rakotovao","Rajaonarimampianina","Rajoelinatinana","Ratsiraka","Rakotomalala"]

profiles = [
  {
    first_name: "Johary",
    last_name: "Rajoelina",
    city: "Tananarive",
    email: "johary@gmail.com",
    specialist: true,
    password: "lewagon"
},

  {
    first_name: "Tsiry",
    last_name: "Rakotomalala",
    city: "Tuléar",
    email: "tsiry@gmail.com",
    specialist: true,
    password: "lewagon"
  },

    {
    first_name: "Fialy",
    last_name: "Rakotovao",
    city: "Antsirabé",
    email: "fialy@gmail.com",
    specialist: true,
    password: "lewagon"
  },
    {
    first_name: "Andry",
    last_name: "Rajaonarimampianina",
    city: "Fianarantsoa",
    email: "andry@gmail.com",
    specialist: true,
    password: "lewagon"
  },
 {
    first_name: "Fetinaty",
    last_name: "Ratsiraka",
    city: "Toamasina",
    email: "Fetinaty@gmail.com",
    specialist: true,
    password: "lewagon"
  },
    {
    first_name: "Didier",
    last_name: "Rajaonarimampianina",
    city: "Antsirabé",
    email: "didier@gmail.com",
    specialist: true,
    password: "lewagon"
  }

]

profiles.each do |profile|
  user = User.new(profile)
  user.save!
end

 puts "Seed is ok"


# puts "Deleting existing #{Patient.count} patients ..."
# Patient.destroy_all

# puts "Creating new patients ..."

# 15.times do
#   patient = Patient.new (
#     first_name:
#     last_name:
#     birthdate:
#     gender:
#     address:
#     city:
#     phone_number:

#     )
#     patient.save!
#   end


# puts "Deleting existing #{Glucose_levels.count} glucose_levels ..."
# Glucose_levels.destroy_all

# puts "Creating new glucose_levels ..."

#  2.times do
#   glucose_levels = Glucose_levels.new (
#     patient_id:
#     measured_at:
#     glucose_level:
#     )
#     glucose_level.save
#  end











