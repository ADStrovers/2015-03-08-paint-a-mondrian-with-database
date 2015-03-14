module LoadButtonHandler
  
  # Public: #create_form
  # Creates the HTML for the select dropdown menu for loading mondrians
  #
  # Parameters:
  # canvas_array: Array: Array holding all of the user's canvases as objects.
  #
  # Returns:
  # A String containing all of the HTML needed for the select element.
  #
  # State Changes:
  # None
  
  def load_button(canvas_array)
    output = []
    
    output << "<select id='load-value'>"
    canvas_array.each do |x|
      output << partial(:'/partials/select_options', :layout => false, :locals => { :canvas => x})
    end
    output << "</select>"
    
    output.join("\n")
  end
  
end