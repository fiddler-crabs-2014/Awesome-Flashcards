get '/decks'
  @decks = Deck.all
  erb :decks
end

get '/decks/:id'
  @deck = Deck.find(params[:id])
  @cards = deck.cards
  erb :deck
end

get '/deck'
end

get '/card'
end

post '/card'
end

