require 'bundler'

Bundler.require

require_relative 'config/datamapper'
require_relative 'config/sass'
require_relative 'models/term'

get '/' do
  @term = Term.all.sample

  haml :index
end

get '/new' do
  haml :new
end

post '/terms' do
  term = Term.new(params[:term])

  if term.save
    redirect '/'
  else
    redirect '/new'
  end
end
