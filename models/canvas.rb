class Canvas < ActiveRecord::Base
  self.table_name = "canvases"
  belongs_to :user
  has_many :rows
  
  def create_blank_canvas
    binding.pry
    color_array = []
    i = 1
    number_of_columns.times { color_array << "white" }
    while i <= number_of_rows
      Row.create({canvas_id: id, saveString: color_array.join(",")})
      i += 1
    end
  end  
  
  # Excellent opportunity here to give rows/columns into each canvas item as part of the options hash.
  def ready_for_mondrian
    output = {}
    row_counter = 1
    column_counter = 1
    canvas_rows = Row.where(canvas_id: id)
    
    canvas_rows.each do |x|
      binding.pry
      row_array = x.saveString.split(",")
      row_array.each do |x|
        while column_counter <= number_of_columns
          output["row_#{row_counter}_column_#{column_counter}"] = x
          column_counter += 1
        end
      end
      column_counter = 1
      row_counter += 1
    end
    binding.pry
    output
  end
end