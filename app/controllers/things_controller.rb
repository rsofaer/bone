class ThingsController < ApplicationController
  respond_to :json # AJAX only

  def index
    respond_with Thing.all
  end

  def create
    respond_with Thing.create(params[:thing])
  end

  def show
    respond_with Thing.find(params[:id])
  end

  def update
    @thing = Thing.find params[:id]
    @thing.update_attributes params[:thing]

    respond_with @thing
  end

  def destroy
    Thing.find(params[:id]).destroy
    respond_with 'OK', status: 200
  end
end
