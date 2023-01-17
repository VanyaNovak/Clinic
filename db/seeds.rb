# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = Category.create(
  [
     {
       title: "Psychiatrists"
     },
     {
       title: "Neurologists"
     },
     {
       title: "Anesthesiologists"
     },
     {
       title: "Pediatricians"
     },
     {
       title: "Cardiologists"
     }
  ]
)

password = "somepass"

categories.each do |category|
  5.times do
    User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
      password: password,
      type: "Doctor",
      category_id: category.id
    )
  end
end
