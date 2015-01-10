class SearchesController < ApplicationController
  def show
    ilike_query = "%#{params[:query]}%"
    users = User.where("username ILIKE ?", ilike_query)
    images = Image.where("name ILIKE ?", ilike_query)
    @results = users + images
  end
end
