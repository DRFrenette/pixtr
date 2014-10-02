class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = Gallery.new
    render :new
  end
  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy

    redirect_to root_path
  end
  
  def create
    # protected from mass assignment until attributes are whitelisted
    @gallery = Gallery.new(gallery_params)
    #name: params[:gallery][:name],
    #description: params[:gallery][:description]
    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  private

  def gallery_params
    gallery_params = params.require(:gallery).permit(:name, :description)
  end
end
