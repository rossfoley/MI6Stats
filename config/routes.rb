Mi6stats::Application.routes.draw do
  match "playerstats/index" => "playerstats#index"
  root :to => "playerstats#index"
end
