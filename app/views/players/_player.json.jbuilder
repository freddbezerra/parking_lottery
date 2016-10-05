json.extract! player, :id, :email, :lucky_number, :winner, :created_at, :updated_at
json.url player_url(player, format: :json)