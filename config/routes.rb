Mi6stats::Application.routes.draw do
  get "assaultrifle/index", as: :assaultrifle

  get "dogtags/index", as: :dogtags
  get "dogtags/top_players", as: :dogtags_top_players

  get "playerstats/index", as: :playerstats
  get "playerstats/table", as: :playerstats_table

  get "mapstats/index", as: :mapstats

  get "serverstats/index", as: :serverstats

  root :to => "serverstats#index"
end
