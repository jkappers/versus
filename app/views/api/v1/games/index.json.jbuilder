json.data @games.each do |game|
  json.id game.id

	json.winner do
		json.id 	 game.winner.id
		json.email game.winner.email
	end

	json.loser do
		json.id 	 game.loser.id
		json.email game.loser.email
	end
end
