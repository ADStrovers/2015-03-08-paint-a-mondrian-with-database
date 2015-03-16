before "/mondrian" do
  @canvas = Canvas.find_by(id: session[:canvas_id]) || Canvas.find_by(user_id: session[:user_id])
  @user = User.find(session[:user_id])
  if @canvas.nil?
    redirect to("/mondrian/new")
  end
end

get "/mondrian" do
  @user_canvases = Canvas.where(user_id: session[:user_id])
  rows = Row.where(canvas_id: @canvas.id)
  @color_array = []
  rows.each do |x|
    @color_array += x.saveString.split(",")
  end
  erb :"canvas/canvas_view"
end
  
post "/mondrian" do
  @rows = Row.where(canvas_id: @canvas.id)
  update_rows(@rows, params)
  "Canvas successfully saved."
end

get "/mondrian/new" do
  erb :"canvas/canvas_new", :layout => :"layouts/form_layout"
end

post "/mondrian/create" do
  params["user_id"] = session[:user_id]
  @obj = Canvas.create(params)
  @obj.create_blank_canvas
  session[:canvas_id] = @obj.id
  redirect to("/mondrian")
end

post "/mondrian/:id" do
  session[:canvas_id] = params["id"]
  @canvas = Canvas.find_by(id: params["id"])
  rows = Row.where(canvas_id: @canvas.id)
  @color_array = []
  rows.each do |x|
    @color_array += x.saveString.split(",")
  end
  canvas_create(@canvas.number_of_rows, @canvas.number_of_columns, @color_array)
end