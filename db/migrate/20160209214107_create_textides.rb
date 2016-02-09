class CreateTextides < ActiveRecord::Migration
  def change
    create_table :textides do |t|
      t.text :body
      t.datetime :created_at
    end
  end
end
