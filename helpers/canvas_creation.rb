module CanvasCreation
  
  def canvas_create(rows, columns)
    row_counter = 1
    column_counter = 1
    output = []
    
    while row_counter <= rows
      output << "<div>"
      while column_counter <= columns
        output << partial(:'/partials/canvas_row', :layout => false, 
                          :locals => { :row_number => row_counter, :column_number => column_counter })
        column_counter += 1
      end
      output << "</div>"
      column_counter = 1
      row_counter += 1
    end
    output.join("\n")
  end
  
end