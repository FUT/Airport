class AddStateToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :state, :string
  end
end
