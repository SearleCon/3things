class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :duration
      t.decimal :price
      t.boolean :active
      t.boolean :is_free

      t.timestamps
    end
  end
end
