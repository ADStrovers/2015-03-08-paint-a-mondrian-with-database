get "/mondrian" do
  erb :"canvas/canvas_view"
end

get "/mondrian/new" do
  erb :"canvas/canvas_new", :layout => :"layouts/form_layout"
end
  
post "/mondrian" do
  params["user_id"] = session[:user_id]
  new_canvas = Canvas.create(params)
  "Canvas successfully saved.  ID: #{new_canvas.id}."
end

post "/mondrian/create" do
  params["user_id"] = session[:user_id]
  @obj = Canvas.create(params)
  @obj.create_blank_canvas
  redirect to("/mondrian/#{@obj.id}"), 307
end

post "/mondrian/:id" do
  canvas = Canvas.find_by(id: params["id"])
  canvas_hash = canvas.ready_for_mondrian
  canvas_hash.to_json
end