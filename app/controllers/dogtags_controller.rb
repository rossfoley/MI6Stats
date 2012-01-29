class DogtagsController < ApplicationController
  def index
    @dogtags = Dogtags.all_with_names.page(params[:page])
  end

  def top_players
    @dogtags = Dogtags.top_players
  end
end
