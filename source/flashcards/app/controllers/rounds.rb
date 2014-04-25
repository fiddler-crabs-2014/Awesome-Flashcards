get '/rounds/view' do
  # Look in app/views/index.erb
  @rounds = Round.all
  erb :'rounds/view_all'
end

get '/rounds/result/:id' do
  # Look in app/views/index.erb
  @round = Round.all
  erb :'rounds/view'
end
