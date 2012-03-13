Mi6stats::Application.routes.draw do
  get "smg/index", as: :smg
  get "shotgun/index", as: :shotgun
  get "projectile/index", as: :projectile
  get "melee/index", as: :melee
  get "lmg/index", as: :lmg
  get "handgun/index", as: :handgun
  get "explosives/index", as: :explosives
  get "sniper/index", as: :sniper
  get "assaultrifle/index", as: :assaultrifle

  get "dogtags/index", as: :dogtags
  get "dogtags/top_players", as: :dogtags_top_players

  get "playerstats/index", as: :playerstats
  get "playerstats/headshots", as: :headshot_table
  get "playerstats/table", as: :playerstats_table

  get "mapstats/index", as: :mapstats
  get "mapstats/table", as: :mapstats_table

  get "serverstats/index", as: :serverstats

  root :to => "serverstats#index"
end
