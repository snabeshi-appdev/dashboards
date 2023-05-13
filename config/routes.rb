Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/forex", {:controller => "currencies", :action => "pair_currencies"})
  get("/forex/:symbols", {:controller => "currencies", :action => "select_currency"})
end
