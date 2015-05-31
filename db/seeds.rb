david = User.create!(name: 'David', email: 'david@example.com', password: 'password', password_confirmation: 'password')

davids_camaro = david.vehicles.create!(vin: 'fsdljk')
davids_camaro.time_cards.create!()
