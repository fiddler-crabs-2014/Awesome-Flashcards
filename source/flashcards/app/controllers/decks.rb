get '/decks' do
  @decks = Deck.find(:all)
  erb :decks
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @cards = []
  @deck.cards.each do |card|
    @cards << card
  end
  erb :deck
end

post '/deck' do

end

get '/card' do
end

post '/card' do
end

