class PlaneLauncher
  include Sidekiq::Worker

  def perform(plane_id)
    plane = Plane.find plane_id

    plane.launch! and wait_a_bit until plane.launched?
  end

  def wait_a_bit
    sleep 3 * rand
  end
end
