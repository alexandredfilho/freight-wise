class CreateFreightCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :freight_charges do |t|
      t.string :table
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
