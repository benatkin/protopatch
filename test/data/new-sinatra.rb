#!/usr/bin/env ruby -rubygems
require 'sinatra'
require 'haml'

get '/inline' do
  haml '%div.title Hello World'
end

get '/' do
  haml :index
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end
