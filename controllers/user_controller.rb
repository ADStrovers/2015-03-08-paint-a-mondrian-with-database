get "/" do
  if session[:user_id]
    redirect to("/mondrian")
  else
    erb :"user/login", :layout => :"layouts/form_layout"
  end
end

get "/signup" do
  erb :"user/signup", :layout => :"layouts/form_layout"
end

post "/validate" do
  @obj = User.find_by(username: params["username"])
  if @obj.nil?
    session[:message] = "That is not a valid username.  Please try again."
    redirect to("/")
  else
    if BCrypt::Password.new(@obj.password) == params["password"]
      session[:user_id] = @obj.id
      session[:message] = "Welcome back #{params['username']}!"
      redirect to("/mondrian")
    else
      session[:message] = "That is not a valid password!  Please try again."
      redirect to("/")
    end
  end
end

post "/create" do
  if params["password"] == params["validate_password"]
    params["password"] = BCrypt::Password.create(params["password"])
    @obj = User.create({username: params["username"], password: params["password"]})
    session[:user_id] = @obj.id
    redirect to("/mondrian")
  else
    session[:message] = "Sorry.  The given passwords do not match.  Please try again."
    redirect to("/signup")
  end
end

post "/signout" do
  session[:user_id], session[:canvas_id] = nil
  redirect to("/")
end

get "/valid" do
  @obj = User.find_by(username: params["username"])
  if @obj
    session[:user_id] = @obj.id
  else
    session[:message] = "Sorry.  We could not log you in based on the given information.  Please try again."
  end
  redirect to("/")
end