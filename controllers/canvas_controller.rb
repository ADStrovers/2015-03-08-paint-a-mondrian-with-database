get "/" do
  erb :landing
end

post "/" do
  new_canvas = Canvas.new(params)
  new_canvas.save
  "Canvas successfully saved.  ID: #{new_canvas.id}."
end

post "/:id" do
  canvas = Canvas.fetch(params["id"])
  canvas_hash = canvas.ready_for_mondrian
  canvas_hash.to_json
end