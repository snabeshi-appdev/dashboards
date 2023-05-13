class CurrenciesController < ActionController::Base
  def pair_currencies
    api_endpoint = "https://api.exchangerate.host/symbols"
    require "open-uri"
    raw_response = URI.open(api_endpoint).read
    
    require "json"
    parsed_response = JSON.parse(raw_response)
  
    @symbols_array = parsed_response.fetch("symbols")
    
    render({:template => "currency_templates/select_currency.html.erb"})
  end

  def select_currency
    @currency = params.fetch("symbols")
    api_endpoint = "https://api.exchangerate.host/symbols"
    require "open-uri"
    raw_response = URI.open(api_endpoint).read
    
    require "json"
    parsed_response = JSON.parse(raw_response)
  
    @symbols_array = parsed_response.fetch("symbols")
    
    render({:template => "currency_templates/convert_currency.html.erb"})
  end
end
