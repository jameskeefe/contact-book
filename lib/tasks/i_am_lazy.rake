task(:howdy) do
  pp "Howdy there partner!"
end

task(:bientot) do
  pp "Au revoir! A bientot."
end

task(:sample_contacts => :environment) {
  if Rails.env.development?
    Contact.destroy_all
  end

  200.times {
    x = Contact.new
    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
    x.date_of_birth = Faker::Date.birthday(min_age:0, max_age:120)
    x.street_address_1 = Faker::Address.street_address
    x.street_address_2 = Faker::Address.secondary_address
    x.city = Faker::Address.city
    x.state = Faker::Address.state_abbr
    x.zip = Faker::Address.zip
    x.phone= Faker::PhoneNumber.phone_number
    x.notes = Faker::Movies::HarryPotter.quote

    x.save
  }

  pp "Lots of Randos"

  x = Contact.new
  x.first_name = "Minnie"
  x.last_name = "Mouse"
  x.date_of_birth = "November 18, 1928"
  x.save

  pp "Minnie added"

  x = Contact.new
  x.first_name = "Mickey"
  x.last_name = "Mouse"
  x.date_of_birth = "May 15, 1928"
  x.save

  pp "Mickey added"
}
