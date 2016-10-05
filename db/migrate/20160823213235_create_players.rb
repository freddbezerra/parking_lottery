class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email
      t.integer :lucky_number
      t.boolean :winner , default: false

      t.timestamps null: false
    end
  end
end
