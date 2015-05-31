puts '...adding users...'
david = User.create!(name: 'David', email: 'david@example.com', password: 'password',
                     password_confirmation: 'password')
alex = User.create!(name: 'Alex', email: 'alex@example.com', password: 'password',
                    password_confirmation: 'password')
alisha = User.create!(name: 'Alisha', email: 'alisha@example.com', password: 'password',
                      password_confirmation: 'password')

puts '...adding vehicles...'
davids_camaro = david.vehicles.create!(vin: ENV['DAVIDS_CAMARO_VIN'])
alexs_speed_three = alex.vehicles.create!(vin: ENV['ALEXS_SPEED_THREE_VIN'])
alexs_moms_highlander = alex.vehicles.create!(vin: ENV['ALEXS_MOMS_HIGHLANDER_VIN'])
alexs_dads_silverado = alex.vehicles.create!(vin: ENV['ALEXS_DADS_SILVERADO_VIN'])
alishas_focus = alisha.vehicles.create!(vin: ENV['ALISHAS_FOCUS_VIN'])

puts '...adding aesthetic modifications...'
alexs_dads_silverado.modifications.create!(type: 'AestheticModification', manufacturer: 'custom')
