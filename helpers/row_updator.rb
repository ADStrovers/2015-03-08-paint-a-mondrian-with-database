module RowUpdator
  
  # Public: #update_rows
  # Takes in params with the strings full of the color classes from the mondrian and 
  # an array of all the row objects for the canvas.  Then saves the new strings to
  # the database.
  #
  # Parameters:
  # rows_array - Array: Full of objs representing the rows of the canvases.
  # params     - Array: Params filled with keys for the rows and strings of colors for the boxes.
  #
  # Returns:
  # True.
  #
  # State Changes:
  # Updates all row model row's within the database for a given canvas.
  
  # Very frail...  Not associating the params with the rows array
  # Currently it should work because rows_array will be a sorted list
  # from the database pull.  Lowest Row # to Highest.
  def update_rows(rows_array, params)
    rows_array.each_with_index do |x, index|
      index += 1
      x.saveString = params["row_#{index}"]
      x.save
    end
    true
  end
  
end