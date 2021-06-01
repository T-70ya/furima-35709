class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string :postcode,      null: false
      t.integer :area_id,      null: false
      t.string :city,          null: false
      t.string :address,       null: false
      t.string :build
      t.string :number,        null: false
      t.references :recode,    foreign_key: true

      t.timestamps
    end
  end
end
