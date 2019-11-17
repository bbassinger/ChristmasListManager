class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :product
      t.string :store

      t.timestamps
    end
  end
end
