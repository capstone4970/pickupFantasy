class CreateWeekplayerdata < ActiveRecord::Migration
  def change
    create_table :weekplayerdata do |t|
      t.integer :NFLPlayerID
      t.integer :SlotID
      t.integer :CurrentAuctionValue
      t.integer :FantasyPoints
      t.integer :Passyds
      t.integer :Rushyds
      t.integer :Rcvyds
      t.integer :Fumbles
      t.integer :TDPass
      t.integer :TwoPointPass
      t.integer :TwoPointRush
      t.integer :TDRush
      t.integer :TDRcv
      t.integer :TwoPointRcv
      t.integer :ExtraPoint
      t.integer :FieldGoal

      t.timestamps
    end
  end
end
