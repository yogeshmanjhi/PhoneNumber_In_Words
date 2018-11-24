class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :phone

      t.timestamps null: false
    end
  end
end
