get "/mondrian" do
  erb :"canvas/landing"
end

post "/mondrian" do
  params["user_id"] = session[:user_id]
  new_canvas = Canvas.create(params)
  "Canvas successfully saved.  ID: #{new_canvas.id}."
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

post "/mondrian/:id" do
  canvas = Canvas.where(id: params["id"])
  canvas_hash = canvas.ready_for_mondrian
  canvas_hash.to_json
end