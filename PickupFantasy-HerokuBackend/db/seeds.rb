# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Weekplayerdatum.create(NFLPlayerID: 732)

  wplayersPath = "#{Rails.root}/public/WeekPlayersV2.json"
  wplayers = JSON.parse(File.read(wplayersPath))
  wplayers.each do |wplayer|
  	Weekplayerdatum.create!(wplayer)    
  end

  splayersPath = "#{Rails.root}/public/SeasonPlayers.json"
  splayers = JSON.parse(File.read(splayersPath))
  splayers.each do |splayer|
  	Seasonplayerdatum.create!(splayer)    
  end

  sgamesPath = "#{Rails.root}/public/GameWeek.json"
  sgames = JSON.parse(File.read(sgamesPath))
  sgames.each do |sgame|
    Gamesofweek.create!(sgame)
  end

  #sleaguesPath = "#{Rails.root}/public/LeagueSeed.json"
  #sleagues = JSON.parse(File.read(sleaguesPath))
  #sleages.each do |sleague|
  #  League.create!(sleague)
  #end