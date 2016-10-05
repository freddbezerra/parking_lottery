class AddDefaultValueToShowAttributePlayers < ActiveRecord::Migration
   def up
    change_column :players, :winner, :boolean, :default => false
  end
  
  def down
    change_column :players, :winner, :boolean, :default => nil
  end
end
