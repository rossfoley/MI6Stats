Mi6stats::Application.routes.draw do
  match "playerstats/index" => "playerstats#index"
  match "playerstats/table" => "playerstats#table"
  root :to => "playerstats#index"
end
