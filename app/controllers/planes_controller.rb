class PlanesController < ApplicationController
  respond_to :html, :json

  def index
    @history = params[:history].present?
    @planes = @history ? Plane.launched.by_lauch : Plane.not_launched.by_creation
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
    params[:planes].each { |id| PlaneLauncher.perform_async id }
    redirect_to action: :index
  end
end
