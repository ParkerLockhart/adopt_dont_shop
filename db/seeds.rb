# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Pet.destroy_all
Application.destroy_all
VeterinaryOffice.destroy_all
Veterinarian.destroy_all
ApplicationPet.destroy_all

shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
shelter_4 = Shelter.create(name: "City Rescue", city: "Starfield, TX", rank: 4, foster_program: true)

lucy = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id)
lobster = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter_1.id)
pirate = shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
clawdia = shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
ahmet = shelter_3.pets.create(name: 'Ahmet', breed: 'tabby', age: 8, adoptable: true)
stitch = shelter_4.pets.create(name: "Stitch", breed: "Whatever", age: 3, adoptable: true)
ann = shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)

app_1 = Application.create!(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "In Progress")

app_1.pets << stitch
app_1.pets << lucy

vet_office = VeterinaryOffice.create(name: 'Best Vets', boarding_services: true, max_patient_capacity: 20)
vet_office_2 = VeterinaryOffice.create(name: 'Vets R Us', boarding_services: true, max_patient_capacity: 20)

vet_1 = vet_office.veterinarians.create(name: 'Taylor', review_rating: 10, on_call: true)
vet_2 = vet_office.veterinarians.create(name: 'Tanya', review_rating: 9, on_call: true)
vet_3 = vet_office.veterinarians.create(name: 'Jim', review_rating: 8, on_call: true)
not_on_call_vet = vet_office.veterinarians.create(name: 'Sam', review_rating: 10, on_call: false)
vet_4 = Veterinarian.create(name: 'Sarah', review_rating: 9, on_call: true, veterinary_office_id: vet_office_2.id)
