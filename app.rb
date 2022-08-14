require 'sinatra'
require 'sinatra/json'
require 'nokogiri'
require 'open-uri'

helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
end

get '/' do
    # request.base_url from https://stackoverflow.com/a/10340736
    usage = "curl -X POST %s -d url=%s" % [request.base_url, 'https://example.com/']
    erb :index, locals: { usage: usage }
end

post '/' do
    url = params['url']
    Nokogiri::HTML(URI.open(params['url'])).css('title').first.text
end