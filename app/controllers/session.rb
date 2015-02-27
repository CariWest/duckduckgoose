get '/' do
  @errors = []
  @user = User.new
  erb :index
end

post '/user/login' do
  user = User.where(username: params[:username]).first

  @errors = []

  if user == nil
    @errors << "User does not exist"
  elsif user.authenticate(params[:password]) == false
    @errors << "Password does not match"
  end

  if @errors.empty?
    session[:id] = user.id
    redirect "/user"
  else
    @user = User.new
    erb :index
  end



  # raise error if user login fails...
  # if user != "nil"
  #   if user.authenticate(params[:password])
  #     session[:id] = user.id
  #     redirect "/user"
  #   else
  #     redirect '/'
  #   end
  # end
end

post '/user/register' do
  p params
  @user = User.new(params[:user])
  p "got here"
  p @user
  @user.save
  puts "inside user/register"
  if @user.persisted?
    puts "inside if"
    session[:id] = @user.id
    redirect "/user"
  else
    erb :index
  end
end

get '/logout' do
  session[:id] = nil
  redirect '/'
end
