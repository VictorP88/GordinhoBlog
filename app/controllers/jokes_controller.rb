class JokesController < ApplicationController
  include HTTParty
  base_uri 'https://api.chucknorris.io'

  def random_joke
    response = self.class.get('/jokes/random')
    @joke = response.parsed_response['value']

    # Armazenando a piada na sessão
    session[:joke] = @joke

    # Redireciona para a página inicial
    redirect_to root_path
  end
end