module RowUpdator
  
  # Very frail...  Not associating the params with the rows array
  # Currently it should work because rows_array will be a sorted list
  # from the database pull.  Lowest Row # to Highest.
  def update_rows(rows_array, params)
    rows_array.each_with_index do |x, index|
      binding.pry
      index += 1
      x.saveString = params["row_#{index}"]
      x.save
    end
  end
  
end