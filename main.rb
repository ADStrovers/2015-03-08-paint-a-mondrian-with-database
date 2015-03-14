require 'sinatra'
require 'pry'
require 'json'
require 'open-uri'
require 'sinatra/activerecord'
require 'bcrypt'
require 'sinatra/partial'

set :bind, '0.0.0.0'

set :partial_template_engine, :erb
enable :sessions

configure :development do
  require 'sqlite3'
  DATABASE = SQLite3::Database.new("database.db")
  set :database, {adapter: "sqlite3", database: "database.db"}
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'])
  
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

Dir["./database/*.rb"].each{ |file| require file }
Dir["./controllers/*.rb"].each{ |file| require file }
Dir["./views/*.rb"].each{ |file| require file }
Dir["./models/*.rb"].each{ |file| require file }
Dir["./helpers/*.rb"].each{ |file| require file }

helpers CanvasCreation, RowUpdator, LoadButtonHandler