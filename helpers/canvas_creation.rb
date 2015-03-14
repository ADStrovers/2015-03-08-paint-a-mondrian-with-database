module CanvasCreation
  
  # Public: #canvas_create
  # Iterates and creates the HTML for a mondrian based on passed in rows, columns, and colors given.
  #
  # Parameters:
  # rows        - Integer: Number of rows in the given mondrian
  # columns     - Integer: Number of columns in the given mondrian
  # color_array - Array: An Array of strings containing the color class for all box's of the mondrian.
  #
  # Returns:
  # A String containing the HTML to create the mondrian.
  #
  # State Changes:
  # None
  
  def canvas_create(rows, columns, color_array)
    row_counter = 1
    column_counter = 1
    output = []
    
    while row_counter <= rows
      output << "<div>"
      while column_counter <= columns
        position = (row_counter - 1) * columns + (column_counter - 1)  #subtracting the base case of 1 and 1 from position to get array position.
        output << partial(:'/partials/canvas_row', :layout => false, 
                          :locals => { :row_number => row_counter, :column_number => column_counter, :color => color_array[position] })
        column_counter += 1
      end
      output << "</div>"
      column_counter = 1
      row_counter += 1
    end
    output.join("\n")
  end
  
end