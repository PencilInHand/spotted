puts '...adding users...'
david = User.create!(name: 'David', email: 'david@example.com', password: 'password', password_confirmation: 'password')

puts '...adding vehicles...'
davids_camaro = david.vehicles.create!(vin: '2G1FB1E35C9166756')
