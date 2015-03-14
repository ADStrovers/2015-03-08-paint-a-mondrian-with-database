module LoadButtonHandler
  
  def load_button(canvas_array)
    output = []
    binding.pry
    
    output << "<select>"
    canvas_array.each do |x|
      output << partial(:'/partials/select_options', :layout => false, :locals => { :canvas => x})
    end
    output << "</select>"
    
    output.join("\n")
  end
  
end