class HomesController < ApplicationController

  def new
    @newst_blog = Blog.all.desc(:id).limit(3)
    @newst_stats = Record.all.desc(:dt).limit(5)
  end

end
