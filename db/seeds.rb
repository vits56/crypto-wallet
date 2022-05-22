# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding database...'

coins = [
  {
    description: 'Bitcoin',
    acronym: 'BTC',
    url_image: 'https://www.dhresource.com/0x0/f2/albu/g9/M00/27/85/rBVaVVxO822ACwv4AALYau1h4a8355.jpg'
  },
  {
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://image.shutterstock.com/image-photo/image-260nw-748625884.jpg'
  },
  {
    description: 'Litecoin',
    acronym: 'LTC',
    url_image: 'https://image.shutterstock.com/image-vector/litecoin-symbol-vector-illustration-ltc-260nw-1806389452.jpg'
  },
  {
    description: 'Bitcoin Cash',
    acronym: 'BCH',
    url_image: 'https://www.cryptoiqtrading.com/wp-content/uploads/2019/01/BCH-logo.png'
  },
  {
    description: 'Tether',
    acronym: 'USDT',
    url_image: 'https://cdn-icons-png.flaticon.com/512/825/825508.png'
  },
  {
    description: 'Stellar',
    acronym: 'XLM',
    url_image: 'https://ownsnap.com/wp-content/uploads/2021/09/t_stellar-xlm9125.jpeg'
  }
]

coins.each do |coin|
  Coin.find_or_create_by(coin)
end

puts 'Seeding database...DONE'
