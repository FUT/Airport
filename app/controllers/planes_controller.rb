class PlanesController < ApplicationController
  respond_to :json, :html

  before_filter :init_plane, only: [:show, :launch]

  def index
    @planes = Plane.not_launched
    respond_with @planes
  end

  def create
    @plane = Plane.create name: Faker::Internet.domain_word
  end

  def show
  end

  def launch
    PlaneLauncher.perform_async params[:id]
  end

  private
  def init_plane
    @plane = Plane.find params[:id]
  end
end
