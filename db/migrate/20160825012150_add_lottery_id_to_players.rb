class AddLotteryIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :lottery_id, :integer
  end
end
