class DogtagsController < ApplicationController
  def index
    @dogtags = Dogtags.all_with_names
  end

  def top_players
    @dogtags = Dogtags.top_players
  end
end
