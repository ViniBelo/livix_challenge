class CreateUserDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_details, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :balance, precision: 10, scale: 2, :null => false, :default => 0.00

      t.timestamps
    end
  end
end
