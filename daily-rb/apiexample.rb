require 'rubygems'
require 'httparty'

class EdutechnicalResty
  include HTTParty
  base_uri 'edutechional-resty.herokuapp.com/'

  def posts
    self.class.get('/posts.json')
  end
end

eddy = EdutechnicalResty.new
puts eddy.posts
