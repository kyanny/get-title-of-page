require 'sinatra'
require 'sinatra/json'
require 'nokogiri'
require 'open-uri'

get '/' do
    "curl https://get-title-of-page.herokuapp.com/ -d url=https://example.com/"
end

post '/' do
    url = params['url']
    Nokogiri::HTML(URI.open(params['url'])).css('title').text
end