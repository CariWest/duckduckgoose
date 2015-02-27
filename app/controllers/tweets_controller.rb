get '/user' do
  @user = User.find(session[:id])
  @tweets = @user.tweets
  erb :"users/user_page"
end

post '/user' do
  @user = User.find(session[:id])

  @tweet = Tweet.new(params)
  @tweet.user_id = @user.id

  if @tweet.save
    redirect '/user'
  else
    "You can't do that"
  end
end
