class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userID
      t.string :username
      t.string :phoneCred
      t.integer :won
      t.integer :lost
      t.integer :previousGamePlace
      t.string :leagueName
      t.integer :rosterID

      t.timestamps
    end
  end
end
