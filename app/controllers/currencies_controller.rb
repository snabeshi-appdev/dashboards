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
    @from_currency = params.fetch("from_currency")
    api_endpoint = "https://api.exchangerate.host/symbols"
    require "open-uri"
    raw_response = URI.open(api_endpoint).read
    
    require "json"
    parsed_response = JSON.parse(raw_response)
  
    @symbols_array = parsed_response.fetch("symbols")
    
    render({:template => "currency_templates/convert_currency.html.erb"})
  end

  def convert_currency
    @from_currency = params.fetch("from_currency")
    @to_currency = params.fetch("to_currency")
    api_endpoint = "https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}"
    require "open-uri"
    raw_response = URI.open(api_endpoint).read
    
    require "json"
    parsed_response = JSON.parse(raw_response)
  
    info_array = parsed_response.fetch("info")
    @rate = info_array.fetch("rate")
    
    render({:template => "currency_templates/show_conversion.html.erb"})
  end


end
