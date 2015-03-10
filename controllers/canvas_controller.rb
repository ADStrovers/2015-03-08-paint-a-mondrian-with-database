get "/" do
  erb :landing
end

post "/" do
  new_canvas = Canvas.create(params)
  "Canvas successfully saved.  ID: #{new_canvas.id}."
end

post "/:id" do
  canvas = Canvas.find_by(id: params["id"])
  canvas_hash = canvas.ready_for_mondrian
  canvas_hash.to_json
end