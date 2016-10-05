class AddDefaultValueToShowAttributeLottery < ActiveRecord::Migration
  def up
    change_column :lotteries, :closed, :boolean, :default => false
  end
  
  def down
     change_column :lotteries, :closed, :boolean, :default => nil
  end
end
