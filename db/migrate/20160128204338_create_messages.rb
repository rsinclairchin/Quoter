class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.text :message
        t.references :user
        t.references :contact

        t.timestamps null: false
    end
  end
end
