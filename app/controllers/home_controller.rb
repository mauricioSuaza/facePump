class HomeController < ApplicationController
  def front
  end

  def index
    @post = Post.new
  end
end
