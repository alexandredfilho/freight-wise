class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street_details
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :zip_code
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
