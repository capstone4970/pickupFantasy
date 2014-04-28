class CreateSeasonplayerdata < ActiveRecord::Migration
  def change
    create_table :seasonplayerdata do |t|
      t.integer :NFLPlayerID
      t.integer :cbsID
      t.integer :nerdID
      t.string :CurrentTeam
      t.string :FantasyPosition
      t.integer :Number
      t.string :FirstName
      t.string :LastName
      t.integer :InitialAuctionValue
      t.integer :CurrentAuctionValue
      t.integer :projFantasyPoints
      t.integer :projFantasyPointsMark
      t.integer :LastPlayedPoints

      t.timestamps
    end
  end
end
