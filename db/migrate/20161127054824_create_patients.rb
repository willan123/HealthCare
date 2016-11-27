class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.date :conception_date
      t.string :phone
      t.string :location

      t.timestamps
    end
  end
end
