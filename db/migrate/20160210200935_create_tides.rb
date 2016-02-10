class CreateTides < ActiveRecord::Migration
  def change
    create_table :tides do |t|
      t.text :body, default: ''
      t.datetime :created_at
      t.string :hex
    end
  end
end
