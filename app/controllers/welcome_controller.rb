class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:nome]
    @curso = "Ruby on Rails"
  end
end
