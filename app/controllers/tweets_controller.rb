get '/user' do
  # @user = User.find(session[:user_id])
  erb :"users/user_page"
end


post '/user' do
  @tweet = Tweet.new(params)
  if @tweet.save
    redirect '/user'
  else
    "You can't do that"
  end
end