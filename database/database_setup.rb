unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.text :username
    t.text :password
  end
end

unless ActiveRecord::Base.connection.table_exists?(:rows)
  ActiveRecord::Base.connection.create_table :rows do |t|
    t.integer :canvas_id
    t.text    :saveString
  end
end

unless ActiveRecord::Base.connection.table_exists?(:canvases)
  ActiveRecord::Base.connection.create_table :canvases do |t|
    t.integer :user_id
    t.text    :name
    t.integer :number_of_rows
    t.integer :number_of_columns
  end
end
                  
# DATABASE.execute("CREATE TABLE IF NOT EXISTS users (
#                   id INTEGER PRIMARY KEY,
#                   username TEXT UNIQUE CHECK(username!=''),
#                   password TEXT CHECK(password!=''))")