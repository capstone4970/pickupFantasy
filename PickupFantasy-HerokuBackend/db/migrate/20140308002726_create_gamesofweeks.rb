class CreateGamesofweeks < ActiveRecord::Migration
  def change
    create_table :gamesofweeks do |t|
      t.string :gameKey
      t.string :gameID
      t.string :time
      t.string :date
      t.string :homeTeam
      t.string :awayTeam

      t.timestamps
    end
  end
end
