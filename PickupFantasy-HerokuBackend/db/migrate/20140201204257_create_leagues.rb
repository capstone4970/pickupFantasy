class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.integer :leagueID
      t.string :name
      t.string :password
      t.integer :numPlayers
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :member4
      t.string :member5
      t.string :member6
      t.string :gamesOfWeekIdentifier

      t.timestamps
    end
  end
end
