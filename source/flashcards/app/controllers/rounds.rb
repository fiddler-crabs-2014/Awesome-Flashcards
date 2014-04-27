
get '/rounds/view' do
  # Look in app/views/index.erb
  @data = current_user
  @rounds = Round.where(user_id: @user.id)

  erb :'rounds/view_all'
end

get '/rounds/result/:id' do
  # Look in app/views/index.erb
  @round = Round.find(params[:id])
  @data = current_user
  erb :'rounds/result'
end

get '/rounds/new' do
  # session[:user_id] = User.first.id
  @deck = Deck.all
  @data = current_user
  erb :'rounds/new'
end

post '/rounds/quiz' do

  @data = current_user
  new_round = params.has_key?('deck_id')
  puts "*"*70
  puts new_round
  puts "*"*70
  # if the params has a key then we need to create a new round
  if new_round
    deck = Deck.find(params['deck_id'])
    player = User.find(session['user_id'])
    @round = Round.create(user_id: session['user_id'], deck_id: deck.id, target_questions:5)
    player.decks << deck
    player.save
    session[:round_id] = @round.id
  else
    # the else method is has the
    @round = Round.find(session[:round_id])
  end

  unless new_round
    prior_guess = Guess.create(card_id: session[:card_id], round_id: session[:round_id], answer: params[:answer])
  end

  if @round.done?
    redirect 'rounds/result/' + @round.id.to_s
    erb :'rounds/result'
  else
    @card = @round.get_next_card
    session['card_id'] = @card.id
    erb :'rounds/quiz'
  end
end

get '/rounds/result/' do
  @data = current_user
  # Look in app/views/index.erb
  @round = Round.all
  erb :'rounds/view'
end

def current_user
  @user = User.find(session[:user_id])
  if @user
    @username = @user.username
    @email = @user.email
    @decks = @user.decks
  else
    redirect '/signin'
  end
end

