class AddUpdatedAtToTides < ActiveRecord::Migration
  def change
    add_column :tides, :updated_at, :datetime
  end
end
