get '/rounds/view' do
  # Look in app/views/index.erb
  @rounds = Round.all
  erb :'rounds/view_all'
end

get '/rounds/result/' do
  # Look in app/views/index.erb

  @round = Round.all
  erb :'rounds/view'
end

get '/rounds/new' do
  session[:user_id] = User.first.id
  @deck = Deck.all
  erb :'rounds/new'
end

post '/rounds/quiz' do
  # if the params has a key then we need to create a new round
  if params.has_key?('deck_name')
    deck = Deck.where(name: params['deck_name']).first
    @round = Round.create(user_id: session['user_id'], deck_id: deck.id, target_questions:5)
    session[:round_id] = @round.id

  else
    # the else method is has the
    @round = Round.find(session[:round_id])
  end

  if @round.done?
    erb :'rounds/result'
  else
    prior_guess = Guess.create(card_id: session[:card_id], round_id: session[:round_id], answer: params[:answer])
    @card = @round.get_next_card
    session['card_id'] = @card.id
    erb :'rounds/quiz'
  end
end

get '/rounds/result/' do
  # Look in app/views/index.erb
  @round = Round.all
  erb :'rounds/view'
end
