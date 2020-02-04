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

profiles_users = [
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

profiles_users.each do |profile|
  user = User.new(profile)
  user.save!
end

 puts "Profiles seed is ok"


puts "Deleting existing #{Patient.count} patients ..."
Patient.destroy_all

puts "Creating new patients ..."

Profiles_patients = [
  {
    first_name: "Aina",
    last_name: "Fanantenana",
    address: "8 Route d'Amborovy Manoa",
    city: "Mahajanga",
    phone_number:"+261 40 22 515 02"
  },
  {
    first_name:"Beloha",
    last_name: "Nandrasana",
    address:"10 rue Pasteur Groult",
    city: "Fianarantsoa",
    phone_number: "261 40 15 715 12"
  },
  {
    first_name:"Dany",
    last_name: "Rabesandratana",
    address: "7 rue Rakotozafy Alphonse",
    city: "Fianarantsoa",
    phone_number: "261 20 38 525 01"
  },
  {
    first_name: "Eva",
    last_name: "Rajolomanana",
    address:"12 RN8a",
    city: "Maintirano",
    phone_number: "261 22 18 125 01"
  },
  {
    first_name: "Fiary",
    last_name:"Tsaroanana",
    address: "12 R J Bezara",
    city: "Antsiranana",
    phone_number: "261 20 35 544 18"
  },
  {
    first_name: "Hejo",
    last_name: "Voahirana",
    address:"Cité Seimad Marofinaritra",
    city: "Mananjary",
    phone_number: "+261 25 92 154 00"
  },
  {
    first_name: "Jery",
    last_name: "Naivomalana",
    address: "12 rue de l'école Ménagère",
    city: "Tuléar",
    phone_number: "+261 30 42 340 84"
  },
  {
    first_name: "Johary",
    last_name: "Serasandratra",
    address: "12 Kimuni Rd",
    city: "Morondava",
    phone_number: "+261 51 21 140 12"
  },
  {
    first_name: "Kanto",
    last_name: "Rakotamanana",
    address: "14 avenue du 14 Octobre",
    city: "Majunga",
    phone_number: "+261 10 12 510 88"
  },
  {
    first_name: "Maeva",
    last_name: "Tsimahy",
    address: "12 rue Berthelot",
    city: "Majunga",
    phone_number: "+261 10 22 510 01"
  },
  {
    first_name: "Mizo",
    last_name:"Valisoa",
    address: "Tanambao Ombimena BP 30",
    city: "Manakara",
    phone_number: "+261 01 22 588 02"
  },
  {
    first_name: "Nary",
    last_name: "Marinomalana",
    address: "12 rue de la Reine Betty",
    city:"Antsiranana",
    phone_number: "+261 10 00 548 02"
  },
  {
    first_name: "Oly",
    last_name: "Naivonofy",
    address: "15 route de la Pyrotechnie",
    city: "Antsiranana",
    phone_number: "+261 62 82 546 02"
  },
  {
    first_name:"Patsy",
    last_name: "Landerana",
    address:"15 rue Edward Nestor",
    city: "Tuléar",
    phone_number: "+261 20 22 540 02"
  },
  {
    first_name:"Rina",
    last_name: "Livasoa",
    address: " 12 Rue Michel Mahazo",
    city: "Toamasina",
    phone_number: "+261 642856319"
  }

]


profiles_patients.each do |profile|
  user = User.new(profile)
    user << birthdate: Faker::Date.birthday(min_age: 18, max_age: 25)
    user << gender: Faker::Gender.binary_type

  user.save!
end
    patient.save!
  end


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











