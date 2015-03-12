DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS canvases (
                  id INTEGER PRIMARY KEY,
                  user_id INTEGER,
                  saveString TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS users (
                  id INTEGER PRIMARY KEY,
                  username TEXT UNIQUE CHECK(username!=''),
                  password TEXT CHECK(password!=''))")