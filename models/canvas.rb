class Canvas < ActiveRecord::Base
  attr_accessor :id, :saveString
  
  # def initialize(options)
  #   @id = options["id"]
  #   @saveString = options["saveString"]
  # end
  
  # def save
  #   if @id.nil?
  #     DATABASE.execute("INSERT INTO canvases (saveString) VALUES ('#{saveString}')")
  #     @id = DATABASE.last_insert_row_id
  #   else
  #     DATABASE.execute("INSERT INTO canvases (saveString) VALUES ('#{saveString}') WHERE id = #{id}")
  #   end
  #
  #   @id
  # end
  
  def to_hash
    hash = {}
    attributes = []
    instance_variables.each do |i|
      key = i.to_s.delete("@")
      hash[key] = self.send(key)
    end
    hash
  end
  
  # def self.fetch(id)
  #   canvas = DATABASE.execute("SELECT * FROM canvases WHERE id = #{id}")[0]
  #
  #   self.new(canvas)
  # end
  
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