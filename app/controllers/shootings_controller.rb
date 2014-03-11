class ShootingsController < ApplicationController
  def show
    @shootings = Movie.find(params[:movie_id]).shootings
    respond_to do |format|
      format.js { render :json => @shootings.to_json }
    end
  end
end
