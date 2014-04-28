class CreateTestTeams < ActiveRecord::Migration
  def change
    create_table :test_teams do |t|
      t.boolean :active
      t.string :alias
      t.string :city
      t.string :conference
      t.integer :conference_id
      t.datetime :created
      t.string :division
      t.integer :division_id
      t.integer :global_id
      t.integer :team_id
      t.boolean :local_team
      t.string :logo_120x120
      t.string :logo_30x30
      t.string :logo_40x40
      t.string :logo_60x60
      t.string :name
      t.string :primary_color
      t.string :record
      t.string :resource_uri
      t.string :secondary_color
      t.string :slug
      t.integer :stats_id
      t.integer :total_defensive_rank
      t.integer :total_offensive_rank
      t.integer :total_passing_defense_rank
      t.integer :total_passing_offense_rank
      t.integer :total_rushing_defense_rank
      t.integer :total_rushing_offense_rank
      t.datetime :updated

      t.timestamps
    end
  end
end
