class User < ActiveRecord::Base
  has_many :canvases
end