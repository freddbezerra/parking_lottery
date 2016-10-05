class CreateLotteries < ActiveRecord::Migration
  def change
    create_table :lotteries do |t|
      t.date :initial_date
      t.date :final_date
      t.integer :vacancies
      t.boolean :closed , default: false

      t.timestamps null: false
    end
  end
end
