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

delete '/delete/tweet' do
  tweet = Tweet.find(params[:tweet])
  tweet.destroy
  redirect '/user'
end

get '/tweets/all' do
  tweets = Tweet.order(created_at: :desc).first(50)
  erb :tweet_landing_page, locals: { tweets: tweets }
end
