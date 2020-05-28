# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed/Dummy data with dummy decription using Lorem Ipsum
event_00 = Event.create({name: "SheHacks UK", date: "10/03/2020 - 10/05/2020", location: "London, UK", description:"All women hackathon"})
event_01 = Event.create({name: "KnightsHack UK", date: "11/03/2020 - 11/05/2020", location: "London, UK", description:"Medieval theme hackathon"})
event_02 = Event.create({name: "MedHacks UK", date: "12/03/2020 - 12/05/2020", location: "London, UK", description:"Medical theme hackathon"})
event_03 = Event.create({name: "GreenHacks UK", date: "12/13/2020 - 10/15/2020", location: "London, UK", description:"Save the environment theme hackathon"})
event_04 = Event.create({name: "TreeHacks UK", date: "12/29/2020 - 12/30/2020", location: "London, UK", description:"Go green theme hackathon"})