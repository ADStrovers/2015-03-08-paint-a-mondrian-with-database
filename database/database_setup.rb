DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS canvases (
                  id INTEGER PRIMARY KEY,
                  saveString TEXT)")