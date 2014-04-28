
get '/rounds/view' do
  @data = current_user

  @rounds = Round.where(user_id: @user.id)
  erb :'rounds/view_all'
end

get '/rounds/result/:id' do
  @data = current_user

  @round = Round.find(params[:id])
  erb :'rounds/result'
end

get '/rounds/new' do
  @data = current_user

  @decks = Deck.all
  erb :'rounds/new'
end

post '/rounds/quiz' do
  @data = current_user

  new_round = params.has_key?('deck_id')

  # if the params has a key then we need to create a new round

  if new_round
    deck = Deck.find(params['deck_id'])
    player = User.find(session['user_id'])
    @round = Round.create(user_id: session['user_id'], deck_id: deck.id, target_questions:5)
    player.save
    @deck = deck
    session[:round_id] = @round.id
  else
    # the else method is has the
    @round = Round.find(session[:round_id])
    @deck = Deck.find(@round.deck_id)
  end

  unless new_round
    prior_guess = Guess.create(card_id: session[:card_id], round_id: session[:round_id], answer: params[:answer])
  end

  if @round.done?
    puts "IM DONNEEEE DONNENEEEDEDEDE"
    # redirect to 'rounds/result/#{@round.id.to_s}'
    @round = Round.find(@round.id)
    erb :'rounds/result'
  else
    @card = @round.get_next_card
    session['card_id'] = @card.id
    if request.xhr?
      @game_data = {
        deck_name: @deck.name,
        question: @card.question,
        questions_remaining: "#{@round.guesses.count +1} of #{@round.target_questions}",
        correct: "Correct = #{@round.correct_count}"
      }.to_json
    else
      erb :'rounds/quiz'
    end
  end
end

get '/rounds/result/' do
  @data = current_user
  # @round = Round.find(params[:id])
  # @round = Round.all
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

