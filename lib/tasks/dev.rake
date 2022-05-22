# frozen_string_literal: true

namespace :dev do
  desc 'configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando Banco de Dados...') { `rails db:drop` }
      show_spinner('Criando Banco de Dados...') { `rails db:create` }
      show_spinner('Migrando Banco de Dados...') { `rails db:migrate` }
      show_spinner('Semeando Banco de Dados...') { `rails db:seed` }
    else
      puts 'Você não está em ambiente de desenvolvimento'
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
