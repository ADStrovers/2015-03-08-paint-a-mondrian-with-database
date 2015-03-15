class Canvas < ActiveRecord::Base
  self.table_name = "canvases"
  belongs_to :user
  has_many :rows
  
  # Public: #create_blank_canvas
  # Creates a blank canvas based on the canvas's @number_of_rows and @number_of_columns.
  # Automatically sets all boxes to white color to start.
  #
  # Parameters:
  # None.
  #
  # Returns:
  # True
  #
  # State Changes:
  # Creates new rows within the database.
  
  def create_blank_canvas
    color_array = []
    i = 1
    number_of_columns.times { color_array << "white" }
    while i <= number_of_rows
      Row.create({canvas_id: id, saveString: color_array.join(",")})
      i += 1
    end
    true
  end
  
end
  
# => Currently obsoleted.  Was used for returning JSON.
#
#   def ready_for_mondrian
#     output = {}
#     row_counter, column_counter = 1
#     canvas_rows = Row.where(canvas_id: id)
#
#     canvas_rows.each do |x|
#       row_array = x.saveString.split(",")
#       row_array.each do |x|
#         while column_counter <= number_of_columns
#           output["row_#{row_counter}_column_#{column_counter}"] = x
#           column_counter += 1
#         end
#       end
#       column_counter = 1
#       row_counter += 1
#     end
#     output
#   end
# end