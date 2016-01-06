class PuppiesController < ApplicationController
  respond_to :html
  before_action :find_puppy, except: [:index, :new, :create]


  def index
    @puppies = Puppy.all#loads all puppies
    respond_with @puppies
  end

  def show
    #@puppy = Puppy.find(params[:id])#hash with indifferent access
    respond_with @puppy
    end

  def new #allows form to create a new puppy
    @puppy = Puppy.new
    respond_with @puppy
  end

  def create #saves new puppy
    #need to get the info from the forms params
    @puppy = Puppy.create(puppy_params)
    respond_with @puppy#, location: puppy_url(@puppy)
  end

  def edit
#    @puppy = Puppy.find(params[:id])#hash with indifferent access
    respond_with @puppy
  end

  def update
#    @puppy = Puppy.find(params[:id])#hash with indifferent access
    @puppy.update(puppy_params)
    respond_with @puppy

  end

  def destroy
    #@puppy = Puppy.find(params[:id])#hash with indifferent access
    @puppy.destroy
    respond_with @puppy
  end

  private

  def puppy_params
    params.require(:puppy).permit(:owner, :description, :color)
  end

end
