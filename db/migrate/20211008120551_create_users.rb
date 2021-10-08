class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50
      t.string :email, null: false
      t.string :mobile, limit: 10

      t.timestamps
    end
  end
end
