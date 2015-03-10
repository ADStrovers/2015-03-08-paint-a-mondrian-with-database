require 'sinatra'
require 'pry'
require 'nokogiri'
require 'sqlite3'
require 'json'
require 'open-uri'
require 'sinatra-activerecord'

DATABASE = SQLite3::Database.new("database.db")

Dir["./database/*.rb"].each{ |file| require file }
Dir["./controllers/*.rb"].each{ |file| require file }
Dir["./views/*.rb"].each{ |file| require file }
Dir["./models/*.rb"].each{ |file| require file }