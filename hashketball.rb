require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def all_players
  game_hash[:home][:players] + game_hash[:home][:players]

end

def num_points_scored(player)
  game_hash.each do |location, v| #keys: home, away
    game_hash[location][:players].each do |player_stats|
      return player_stats[:points] if player_stats[:player_name] == player
    end
  end


end


def shoe_size(player)
  game_hash.each do |location, v| #keys: home, away
    game_hash[location][:players].each do |player_stats|
      return player_stats[:shoe] if player_stats[:player_name] == player
    end
  end
end

def team_colors(team)
  game_hash.each do |location, v| #keys: home, away
    return game_hash[location][:colors] if game_hash[location][:team_name] == team
  end
end

def team_names
  game_hash.reduce([]) do |teams, (location, attribute)|
    teams << game_hash[location][:team_name]
    teams
  end
end

def player_numbers(team_name)
  game_hash.reduce([]) do |jersey_numbers, (location, attribute)|
    if team_name == game_hash[location][:team_name]
      game_hash[location][:players].each { |player| jersey_numbers << player[:number] }
    end
    jersey_numbers
  end
end

def player_stats(player)
  game_hash.each do |location, attribute|
    game_hash[location][:players].each do |player_stats|
      if player_stats[:player_name] == player
      return player_stats.select { |hash, (k, v)| v.class != String }
      end
    end
  end
end

def big_shoe_rebounds
  really_biggest_shoe = {"name" => 0 }
  game_hash.reduce({"name" => 0 }) do |biggest_shoe, (location, attribute)|
    team_shoe = game_hash[location][:players].reduce({"name" => 0}) do |memo, player_stats|
      name = player_stats[:player_name]
      shoe = player_stats[:shoe]
      if shoe > memo.values[0]
        memo = { name => shoe }
      end
      memo
    end
    if biggest_shoe.values[0] < team_shoe.values[0]
      biggest_shoe = team_shoe
    end
    really_biggest_shoe = biggest_shoe
    biggest_shoe
  end

  name = biggest_shoe.keys[0]

  game_hash.each do |location, v| #keys: home, away
    game_hash[location][:players].each do |player_stats|
      if player_stats[:player_name] == name
        return player_stats[:rebounds]
      end
    end
  end



end
