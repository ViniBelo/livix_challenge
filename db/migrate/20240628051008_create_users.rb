class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.float :balance, null: false, :default => (0.0).to_f

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
