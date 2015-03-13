DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS canvases (
                  id INTEGER PRIMARY KEY,
                  user_id INTEGER,
                  name TEXT,
                  number_of_rows INTEGER,
                  number_of_columns INTEGER)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS users (
                  id INTEGER PRIMARY KEY,
                  username TEXT UNIQUE CHECK(username!=''),
                  password TEXT CHECK(password!=''))")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS rows (
                  id INTEGER PRIMARY KEY,
                  canvas_id INTEGER,
                  saveString TEXT)")