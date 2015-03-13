require 'sinatra'
require 'pry'
require 'sqlite3'
require 'json'
require 'open-uri'
require 'sinatra/activerecord'
require 'bcrypt'
require 'sinatra/partial'

set :bind, '0.0.0.0'

set :partial_template_engine, :erb
enable :sessions

DATABASE = SQLite3::Database.new("database.db")
set :database, {adapter: "sqlite3", database: "database.db"}

Dir["./database/*.rb"].each{ |file| require file }
Dir["./controllers/*.rb"].each{ |file| require file }
Dir["./views/*.rb"].each{ |file| require file }
Dir["./models/*.rb"].each{ |file| require file }
Dir["./helpers/*.rb"].each{ |file| require file }

helpers CanvasCreation