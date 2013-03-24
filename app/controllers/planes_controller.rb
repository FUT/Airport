class PlanesController < ApplicationController
  def index
    @planes = Plane.all

    respond_with @planes
  end

  def create
    @plane = Plane.create params[:plane]

    respond_with @plane
  end

  def launch
  end
end
