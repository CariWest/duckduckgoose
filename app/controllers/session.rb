get '/' do
  @user = User.new
  erb :index
end

post '/user/login' do
  user = User.where(username: params[:username]).first

  # raise error if user login fails...
  if user != "nil"
    if user.authenticate(params[:password])
      session[:id] = user.id
      redirect "/user"
    else
      # flash[:notice] = "Login usuccessful. Try again." #How to implement  ActionDispath::Flash
      redirect '/'
      #instead of redirect, maybe render erb:index with the users input(put that in form value)
    end
  end
end

post '/user/register' do
  @user = User.new(params[:user])
  @user.save
  if @user.persisted?
    redirect "/user"
    session[:id] = user.id
  else
    erb :index
  end
end


