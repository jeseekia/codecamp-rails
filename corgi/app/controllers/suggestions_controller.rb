class SuggestionsController < ApplicationController
  respond_to :html

  def create
    @puppy = Puppy.find(params[:puppy_id])
    @puppy.suggestions.create(suggestion_params)

    respond_with @suggestions, location: puppy_url(@puppy)
  end

  private

  def suggestion_params
    params.require(:suggestions).permit(:name)
  end

end
