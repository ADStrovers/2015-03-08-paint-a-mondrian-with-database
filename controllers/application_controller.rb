before do
  if session[:message]
    @obj = session[:message]
    session[:message] = ""
  end
end