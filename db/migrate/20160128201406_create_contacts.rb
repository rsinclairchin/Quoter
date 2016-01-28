class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :number, null: false
      t.references :user

      t.timestamps null: false
    end
  end
end
