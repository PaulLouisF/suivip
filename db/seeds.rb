# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# puts "Deleting existing #{User.count} users ..."
Ticket.destroy_all
UserConsultation.destroy_all
Prescription.destroy_all
Consultation.destroy_all
GlucoseLevel.destroy_all
Consultation.destroy_all
Patient.destroy_all
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
  },
    {
    first_name: "Paul",
    last_name: "Haja",
    city: "Tana",
    email: "drpaul@gmail.com",
    specialist: true,
    password: "lewagon"
  }
]

profiles_users.each do |profile|
  user = User.new(profile)
  user.save!
end

puts "Profiles users seed is ok"

puts "Creating new patients ..."

profiles_patients = [
  {
    first_name: "Aina",
    last_name: "Fanantenana",
    address: "8 Route d'Amborovy Manoa",
    city: "Mahajanga",
    phone_number:"+261 40 22 515 02",
    gender: "F",
    created_at: "6/11/2019"
  },
  {
    first_name:"Beloha",
    last_name: "Nandrasana",
    address:"10 rue Pasteur Groult",
    city: "Fianarantsoa",
    phone_number: "261 40 15 715 12",
    gender: "H",
    created_at: "26/01/2019"
  },
  {
    first_name:"Dany",
    last_name: "Rabesandratana",
    address: "7 rue Rakotozafy Alphonse",
    city: "Fianarantsoa",
    phone_number: "261 20 38 525 01",
    gender: "H",
    created_at: "14/01/2020"
  },
  {
    first_name: "Eva",
    last_name: "Rajolomanana",
    address:"12 RN8a",
    city: "Maintirano",
    phone_number: "261 22 18 125 01",
    gender: "F",
    created_at: "13/07/2019"
  },
  {
    first_name: "Sara",
    last_name:"Tsaroanana",
    address: "12 R J Bezara",
    city: "Antsiranana",
    phone_number: "261 20 35 544 18",
    gender: "F",
    created_at: "20/01/2020"
  },
  {
    first_name: "Hejo",
    last_name: "Voahirana",
    address:"Cité Seimad Marofinaritra",
    city: "Mananjary",
    phone_number: "+261 25 92 154 00",
    gender: "H",
    created_at: "18/11/2019"
  },
  {
    first_name: "Jery",
    last_name: "Naivomalana",
    address: "12 rue de l'école Ménagère",
    city: "Tuléar",
    phone_number: "+261 30 42 340 84",
    gender: "H",
    created_at: "2/1/2020"
  },
  {
    first_name: "Hanitra",
    last_name: "Serasandratra",
    address: "12 Kimuni Rd",
    city: "Morondava",
    phone_number: "+261 51 21 140 12",
    gender: "F",
    created_at: "23/11/2019"
  },
  {
    first_name: "Claude",
    last_name: "Rakotamanana",
    address: "14 avenue du 14 Octobre",
    city: "Majunga",
    phone_number: "+261 10 12 510 88",
    gender: "H",
    created_at: "1/12/2019"
  },
  {
    first_name: "Maeva",
    last_name: "Tsimahy",
    address: "12 rue Berthelot",
    city: "Majunga",
    phone_number: "+261 10 22 510 01",
    gender: "F",
    created_at: "3/12/2019"
  },
  {
    first_name: "Haja",
    last_name:"Valisoa",
    address: "Tanambao Ombimena BP 30",
    city: "Manakara",
    phone_number: "+261 01 22 588 02",
    gender: "H",
    created_at: "27/11/2019"
  },
  {
    first_name: "Vololona",
    last_name: "Marinomalana",
    address: "12 rue de la Reine Betty",
    city:"Antsiranana",
    phone_number: "+261 10 00 548 02",
    gender: "F",
    created_at: "14/1/2020"
  },
  {
    first_name: "Bodo",
    last_name: "Naivonofy",
    address: "15 route de la Pyrotechnie",
    city: "Antsiranana",
    phone_number: "+261 62 82 546 02",
    gender: "F",
    created_at: "3/2/2020"
  },
  {
    first_name:"Patsy",
    last_name: "Landerana",
    address:"15 rue Edward Nestor",
    city: "Tuléar",
    phone_number: "+261 20 22 540 02",
    gender: "F",
    created_at: "15/2/2020"
  },
  {
    first_name:"Rina",
    last_name: "Livasoa",
    address: " 12 Rue Michel Mahazo",
    city: "Toamasina",
    phone_number: "+261 642856319",
    gender: "H",
    created_at: "25/2/2020"
  }
]


profiles_patients.each do |profile|
  profile[:birthdate] = Faker::Date.birthday(min_age: 6, max_age: 25)
  profile[:gender] = Faker::Gender.binary_type
  patient = Patient.new(profile)
  patient.save!
end

puts "Profiles #{Patient.count} patients seed is ok"

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

puts "Creating new consultations ..."

consultations = [
  {
    weight: 36,
    height: 148,
    report: "Aina boit beaucoup d'eau. Elle se plaint d'aller très souvent aux toilettes",
    created_at: "Wed, 6 Nov 2019 20:25:38 UTC +00:00",
    patient_id: first
  },
    {
    weight: 33,
    height: 148,
    report: "Aina est très fatiguée et a tres soif. Elle a beaucoup maigri ces derniers mois. Une glycémie à jeun met en évidence un diabète de type 1. Un traitement par insuline lui a été donné",
    created_at: "Wed, 20 Nov 2019 20:25:38 UTC +00:00",
    patient_id: first
  },
    {
    weight: 33,
    height: 148,
    report: "Aina est toujours très fatiguée. Elle n'a pas repris de poids depuis le diagnostisque de son diabète.",
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

puts "Creating new prescriptions ..."

last = Consultation.all.pluck(:id).last
prescriptions = [
    {
    medicine_name: "Mix 30/70",
    dose_morning: 6,
    dose_noon: 0,
    dose_night: 5,
    created_at: "Wed, 20 Nov 2019 20:25:38 UTC +00:00",
    consultation_id: last - 3,
    user_id: User.find_by(first_name: 'Fialy').id
  },
    {
    medicine_name: "Mix 30/70",
    dose_morning: 6,
    dose_noon: 0,
    dose_night: 8,
    created_at: "Wed, 18 Dec 2019 20:25:38 UTC +00:00",
    consultation_id: last - 2,
    user_id: User.find_by(first_name: 'Fialy').id
  },
    {
    medicine_name: "Mix 30/70",
    dose_morning: 8,
    dose_noon: 0,
    dose_night: 8,
    created_at: "Tue, 28 Jan 2020 20:25:38 UTC +00:00",
    consultation_id: last - 1,
    user_id: User.find_by(first_name: 'Fialy').id
  },
    {
    medicine_name: "Mix 30/70",
    dose_morning: 10,
    dose_noon: 0,
    dose_night: 8,
    created_at: "Sat, 29 Feb 2020 20:25:38 UTC +00:00",
    consultation_id: last,
    user_id: User.find_by(first_name: 'Paul').id
  }


]

prescriptions.each do |prescription|
  prescrip = Prescription.new(prescription)
  prescrip.save!
end











