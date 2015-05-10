require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require 'slim'
require 'coffee_script'
require 'uri'
require 'digest/sha1'
require 'cloudinary'
require 'logger'

class App < Sinatra::Base
  log = Logger.new(STDOUT)

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @cloud_name = URI(ENV['CLOUDINARY_URL']).host
    slim :index
  end

  post '/sign' do
    api_key, api_secret, cloud_name = URI(ENV['CLOUDINARY_URL']).instance_eval{[user, password, host]}
    params['timestamp'] = Time.now.to_i if params['timestamp'].nil?
    signature = Digest::SHA1.hexdigest(params.sort_by(&:first).map{|k, v| "#{k}=#{v}"}.join('&') + api_secret)
    json params.merge(api_key: api_key, signature: signature)
  end
end
