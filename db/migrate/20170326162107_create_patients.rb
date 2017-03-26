class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :organization_name
      t.string :gender
      t.integer :number_of_conditions

      t.timestamps
    end
  end
end
