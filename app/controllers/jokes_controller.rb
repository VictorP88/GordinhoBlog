class JokesController < ApplicationController
  include HTTParty
  base_uri 'https://api.chucknorris.io'

  def random_joke
    Rails.logger.info("Random joke hit") # Log para confirmação
    response = self.class.get('/jokes/random')
    @joke = response.parsed_response['value']
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end