require 'bundler'

Bundler.require

require_relative 'config/datamapper'
require_relative 'config/sass'
require_relative 'models/term'

get '/' do
  @terms = Term.all

  flashcards = Array.new
  set        = Array.new

  @terms.each do |term|
    flashcards.push(term)
  end

  flashcards = flashcards.shuffle

  flashcards[0..20].each do |flashcard|
    set << flashcard
  end

  @flashcards = set

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
