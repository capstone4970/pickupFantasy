class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :rosterID
      t.string :username
      t.integer :leagueID
      t.integer :qb
      t.integer :flex
      t.integer :k
      t.integer :wr
      t.integer :rb

      t.timestamps
    end
  end
end
