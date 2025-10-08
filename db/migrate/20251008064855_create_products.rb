class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.decimal :rating, precision: 3, scale: 2, default: 0.0
      t.decimal :price, precision: 10, scale: 2, null: false
      t.boolean :is_sale, default: false
      t.date :release_date
      t.integer :available_qty, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :products, :product_name
  end
end
