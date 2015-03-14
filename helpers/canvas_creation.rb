module CanvasCreation
  
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