Mi6stats::Application.routes.draw do
  get "playerstats/index"
  get "playerstats/table"

  get "mapstats/index"

  root :to => "playerstats#index"
end
