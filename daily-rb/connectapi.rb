require 'rubygems'
require 'httparty'

class APITest
  include HTTParty
  base_uri 'sandbox-api.brewerydb.com/v2/'

end
