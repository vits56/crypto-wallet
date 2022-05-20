class WelcomeController < ApplicationController
  def index
    @nome = "João"
    @curso = "Ruby on Rails"
  end
end
