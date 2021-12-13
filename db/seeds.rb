# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Shelter.destroy_all
Application.destoy_all
Veterinarian.destroy_all
VeterinaryOffice.destroy_all
ApplicationPets.destroy_all

shelter_1 = Shelter.where(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9).first_or_create
shelter_2 = Shelter.where(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5).first_or_create
shelter_3 = Shelter.where(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10).first_or_create
shelter_4 = Shelter.where(name: "City Rescue", city: "Starfield, TX", rank: 4, foster_program: true).first_or_create

lucy = Pet.where(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id).first_or_create
lobster = Pet.where(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter_1.id).first_or_create
pirate = shelter_1.pets.where(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true).first_or_create
clawdia = shelter_1.pets.where(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true).first_or_create
ahmet = shelter_3.pets.where(name: 'Ahmet', breed: 'tabby', age: 8, adoptable: true).first_or_create
stitch = shelter_4.pets.where(name: "Stitch", breed: "Whatever", age: 3, adoptable: true).first_or_create
ann = shelter_1.pets.where(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false).first_or_create

app_1 = Application.where(name: "Amy", street_address: "5223 Lovely Ln.", city: "Starfield", state: "TX", zip_code: "78230", description: "I want to take care of a pet who needs help.", status: "In Progress").first_or_create

app_1.pets << stitch
app_1.pets << lucy

vet_office = VeterinaryOffice.where(name: 'Best Vets', boarding_services: true, max_patient_capacity: 20).first_or_create
vet_office_2 = VeterinaryOffice.where(name: 'Vets R Us', boarding_services: true, max_patient_capacity: 20).first_or_create

vet_1 = vet_office.veterinarians.where(name: 'Taylor', review_rating: 10, on_call: true).first_or_create
vet_2 = vet_office.veterinarians.where(name: 'Tanya', review_rating: 9, on_call: true).first_or_create
vet_3 = vet_office.veterinarians.where(name: 'Jim', review_rating: 8, on_call: true).first_or_create
not_on_call_vet = vet_office.veterinarians.where(name: 'Sam', review_rating: 10, on_call: false).first_or_create
vet_4 = Veterinarian.where(name: 'Sarah', review_rating: 9, on_call: true, veterinary_office_id: vet_office_2.id).first_or_create
