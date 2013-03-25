class PlanesController < ApplicationController
  respond_to :html, :json

  def index
    @planes = Plane.not_launched.by_creation
    respond_with @planes
  end

  def history
    @planes = Plane.launched.by_lauch
    respond_with @planes
  end

  def new
    @plane = Plane.create name: Faker::Internet.domain_word
    redirect_to action: :index
  end

  def show
    @plane = Plane.find params[:id]
    respond_with @plane
  end

  def launch
    Plane.where(id: params[:planes]).each(&:be_ready)

    redirect_to action: :index
  end
end
