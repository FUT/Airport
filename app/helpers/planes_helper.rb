module PlanesHelper
  def percentage_text(plane)
    if plane.on_the_ground?
      t 'planes.plane.on_the_ground'
    elsif plane.waiting?
      t 'planes.plane.waiting'
    elsif plane.launching?
      t 'planes.plane.launching', percentage: plane.launched_percentage
    elsif plane.in_the_air?
      t 'planes.plane.in_the_air'
    end
  end
end
