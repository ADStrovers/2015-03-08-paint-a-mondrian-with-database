class Canvas < ActiveRecord::Base
  self.table_name = "canvases"
  
  # Excellent opportunity here to give rows/columns into each canvas item as part of the options hash.
  def ready_for_mondrian
    output = {}
    rows_in_mondrian = 4
    row_counter = 1
    columns_in_mondrian = 4
    column_counter = 1
    
    canvas = saveString.split(",")
    canvas.each do |x|
      while column_counter <= columns_in_mondrian
        output["row_#{row_counter}_column_#{column_counter}"] = x
        if column_counter == columns_in_mondrian && row_counter < rows_in_mondrian
          column_counter = 1
          row_counter += 1
        else
          column_counter += 1
        end
      end
    end
    output
  end
end