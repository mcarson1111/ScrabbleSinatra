require 'sinatra'
require_relative 'lib/scoring'


class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  get '/score-many' do  # - is an html thing!
    erb :score_many     # _ is a ruby thing!
  end

  post '/score-many' do
   @number_of_words = params["number_of_words"].to_i
   @words = params["word"]
     if @words != nil
      @score_array = @words.map do |word|    #params.fetch("word") also does the same thing (its accessing the value of the key word in the hash params)
        Scoring.score word
      end
    end

    erb :score_many
  end


  post '/score' do
    @score = Scoring.score(params["word"])   #when we hit submit/post then it creates a new instance of peep class witht he params (the things that were entered)
    erb :score
  end

  get '/score' do
    erb :score
  end


  run!
end
