# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    cookies[:curso] = 'Curso de Ruby on Rails - Jackson Pires'
    session[:curso] = 'Curso de Ruby on Rails - Jackson Pires'
    @meu_nome = params[:nome]
    @curso = params[:curso]
  end
end
