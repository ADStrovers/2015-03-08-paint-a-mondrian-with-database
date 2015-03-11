require 'sinatra'
require 'pry'
require 'sqlite3'
require 'json'
require 'open-uri'
require 'sinatra/activerecord'
require 'bcrypt'

DATABASE = SQLite3::Database.new("database.db")
set :database, {adapter: "sqlite3", database: "database.db"}

Dir["./database/*.rb"].each{ |file| require file }
Dir["./controllers/*.rb"].each{ |file| require file }
Dir["./views/*.rb"].each{ |file| require file }
Dir["./models/*.rb"].each{ |file| require file }