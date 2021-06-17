class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :age
      t.string :cloth_type
      t.string :gender
      t.string :imgurl
      t.string :size
      t.integer :price

      t.timestamps
    end
  end
end
