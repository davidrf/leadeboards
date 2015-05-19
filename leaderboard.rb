require 'pry'
def game_info
  [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 7,
      away_score: 3
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 3,
      away_score: 0
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 11,
      away_score: 7
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 7,
      away_score: 21
    }
  ]
end

def home_team_wins(game)
  game[:home_score] > game[:away_score]
end

def format_output(team, rank, stats)
  "Team: #{team}, Rank: #{rank}, Wins: #{stats[:wins]}, Losses: #{stats[:losses]}"
end

teams = {}

binding.pry
game_info.each do |game|
  if home_team_wins(game)
    winning_team = game[:home_team]
    losing_team = game[:away_team]
  else
    winning_team = game[:away_team]
    losing_team = game[:home_team]
  end

  if !teams.has_key?(winning_team)
    teams[winning_team] = { wins: 0, losses: 0 }
  end

  unless teams.has_key?(losing_team)
    teams[losing_team] = { wins: 0, losses: 0 }
  end

  teams[winning_team][:wins] += 1
  teams[losing_team][:losses] +=1
end

ranked_teams = teams.sort_by { |team, stats| stats[:losses] }

rank = 1
ranked_teams.each do |team, stats|
  puts format_output(team, rank, stats)
  rank += 1
end

binding.pry
