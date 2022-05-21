namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando Banco de Dados...") { %x(rails db:drop) }
      show_spinner("Criando Banco de Dados...") { %x(rails db:create) }
      show_spinner("Migrando Banco de Dados...") { %x(rails db:migrate) }
      show_spinner("Semeando Banco de Dados...") { %x(rails db:seed) }
    else
      puts "Você não está em ambiente de desenvolvimento"
    end

  end

  private
  def show_spinner(msg_start, msg_end=" Sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
