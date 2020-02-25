# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# puts "Deleting existing #{User.count} users ..."
User.destroy_all

puts "Creating new users ..."

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
  },
      {
    first_name: "Didier",
    last_name: "Rajaonari",
    city: "Antsirabé",
    email: "didier.raja@gmail.com",
    specialist: true,
    password: "lewagon"
  }
]

profiles_users.each do |profile|
  user = User.new(profile)
  user.save!
end

puts "Profiles users seed is ok"

puts "Deleting existing #{Consultation.count} consultations ..."
Consultation.destroy_all


puts "Deleting existing #{Patient.count} patients ..."
Patient.destroy_all

puts "Creating new patients ..."

profiles_patients = [
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
  profile[:birthdate] = Faker::Date.birthday(min_age: 18, max_age: 25)
  profile[:gender] = Faker::Gender.binary_type
  patient = Patient.new(profile)
  patient.save!
end

puts "Profiles #{Patient.count} patients seed is ok"




puts "Deleting existing #{GlucoseLevel.count} glucose_levels ..."
GlucoseLevel.destroy_all

puts "Creating new glucose_levels ..."

n = Patient.all.size
first = Patient.all.pluck(:id).first

glucose_levels = [
  {
    glucose_level: 203,
    measured_at: "Tue, 11 Feb 2020 08:06:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 343,
    measured_at: "Tue, 11 Feb 2020 08:30:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 256,
    measured_at: "Tue, 11 Feb 2020 08:15:38 UTC +00:00",
    patient_id: first
  },
    {
    glucose_level: 246,
    measured_at: "Tue, 11 Feb 2020 08:20:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 370,
    measured_at: "Tue, 11 Feb 2020 08:30:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 307,
    measured_at: "Tue, 11 Feb 2020 07:20:38 UTC +00:00",
    patient_id: first
  },


    {
    glucose_level: 103,
    measured_at: "Tue, 11 Feb 2020 12:06:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 123,
    measured_at: "Tue, 11 Feb 2020 12:30:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 256,
    measured_at: "Tue, 11 Feb 2020 12:15:38 UTC +00:00",
    patient_id: first
  },
    {
    glucose_level: 86,
    measured_at: "Tue, 11 Feb 2020 13:20:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 64,
    measured_at: "Tue, 11 Feb 2020 14:45:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 156,
    measured_at: "Tue, 11 Feb 2020 11:55:38 UTC +00:00",
    patient_id: first
  },
    {
    glucose_level: 183,
    measured_at: "Tue, 11 Feb 2020 19:06:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 140,
    measured_at: "Tue, 11 Feb 2020 19:55:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 175,
    measured_at: "Tue, 11 Feb 2020 18:47:38 UTC +00:00",
    patient_id: first
  },
    {
    glucose_level: 146,
    measured_at: "Tue, 11 Feb 2020 19:06:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 108,
    measured_at: "Tue, 11 Feb 2020 20:35:38 UTC +00:00",
    patient_id: first
  },
  {
    glucose_level: 109,
    measured_at: "Tue, 11 Feb 2020 20:25:38 UTC +00:00",
    patient_id: first
  },
]

glucose_levels.each do |glucose_level|
  gly = GlucoseLevel.new(glucose_level)
  gly.save!
end



puts "Deleting existing #{Consultation.count} consultations ..."
Consultation.destroy_all

puts "Creating new consultations ..."


consultations = [
    {
    weight: 33,
    height: 148,
    report: "Aina est très fatiguée et a tres soif. Elle a beaucoup maigri ces derniers mois. Une glycémie à jeun met en évidence un diabète de type 1. Un traitement par insuline lui a été donné",
    created_at: "Wed, 18 Dec 2019 20:25:38 UTC +00:00",
    patient_id: first
  },
    {
    weight: 35,
    height: 148,
    report: "Aina se sent mieux mais se plaint d'avoir tres soif durant la nuit. Un avis spécialiste est nécessaire pour l'adaptation du traitement.",
    created_at: "Tue, 28 Jan 2020 20:25:38 UTC +00:00",
    patient_id: first
  }
]

consultations.each do |consultation|
  consult = Consultation.new(consultation)
  consult.save!
end



puts "Deleting existing #{Prescription.count} prescriptions ..."
Prescription.destroy_all

puts "Creating new prescriptions ..."


last = Consultation.all.pluck(:id).last
prescriptions = [
  {
    medicine_name: "Mix",
    dose_morning: 6,
    dose_noon: 4,
    dose_night: 8,
    created_at: "Tue, 28 Jan 2020 20:25:38 UTC +00:00",
    consultation_id: last,
    user_id: 3
  },
    {
    medicine_name: "Mix",
    dose_morning: 10,
    dose_noon: 0,
    dose_night: 12,
    created_at: "Wed, 18 Dec 2019 20:25:38 UTC +00:00",
    consultation_id: last - 1,
    user_id: 3
  },

]

prescriptions.each do |prescription|
  prescrip = Prescription.new(prescription)
  prescrip.save!
end








# glucoses_levels = [
#   {
#     glucose_level: "200",
#   },

#   {
#     glucose_level: "340"
#   }

#  ]

# glucoses_levels.each do |glucose_level|
#   glucose_level[:measured_at] = "#{Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning)}"
#   glucose_level = GlucoseLevel.new(glucose_level)
#   glucose_level.patient = Patient.all.sample(1).first
#   glucose_level.save!
# end

# puts "glucose levels seed is ok"













