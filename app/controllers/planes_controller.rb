class PlanesController < ApplicationController
  respond_to :json, :html

  def index
    @planes = Plane.all
    respond_with @planes
  end

  def create
    @plane = Plane.create name: Faker::Internet.domain_word
  end

  def launch
  end
end
