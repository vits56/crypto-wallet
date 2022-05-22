# frozen_string_literal: true

namespace :dev do
  desc 'configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando Banco de Dados...') { `rails db:drop` }
      show_spinner('Criando Banco de Dados...') { `rails db:create` }
      show_spinner('Migrando Banco de Dados...') { `rails db:migrate` }
      `rails dev:add_mining_types`
      `rails dev:add_coins`
    else
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end

  desc 'Cadastra as moedas'
  task add_coins: :environment do
    show_spinner('Cadastrando Moedas...') do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://www.dhresource.com/0x0/f2/albu/g9/M00/27/85/rBVaVVxO822ACwv4AALYau1h4a8355.jpg',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://image.shutterstock.com/image-photo/image-260nw-748625884.jpg',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Litecoin',
          acronym: 'LTC',
          url_image: 'https://image.shutterstock.com/image-vector/litecoin-symbol-vector-illustration-ltc-260nw-1806389452.jpg',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Bitcoin Cash',
          acronym: 'BCH',
          url_image: 'https://www.cryptoiqtrading.com/wp-content/uploads/2019/01/BCH-logo.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Tether',
          acronym: 'USDT',
          url_image: 'https://cdn-icons-png.flaticon.com/512/825/825508.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Stellar',
          acronym: 'XLM',
          url_image: 'https://ownsnap.com/wp-content/uploads/2021/09/t_stellar-xlm9125.jpeg',
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by(coin)
      end
    end
  end

  desc 'Cadastro dos tipos de mineração'
  task add_mining_types: :environment do
    show_spinner('Cadastrando Tipos de Mineração...') do
      mining_types = [
        { description: 'Proof of Work', acronym: 'PoW' },
        { description: 'Proof of Stake', acronym: 'PoS' },
        { description: 'Proof of Capacity', acronym: 'PoC' }
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = ' Sucesso!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end.to_s)
  end
end
