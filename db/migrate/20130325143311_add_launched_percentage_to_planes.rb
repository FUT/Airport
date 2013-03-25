class AddLaunchedPercentageToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :launched_percentage, :decimal, default: 0
  end
end
