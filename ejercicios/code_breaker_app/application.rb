require 'sinatra/base'
require './model/code_breaker.rb'

class MyApplication < Sinatra::Base 
  
   enable :sessions
   
  get '/' do
    erb :home
  end

  get '/palabra' do
    word = params[:word]
    session['codeBreaker'] = CodeBreaker.new(word, 3)
     @state = session['codeBreaker'].getGameStatus().join
    erb:word
  end

  get '/adivinar' do
    letter = params[:letter]
     session['codeBreaker'].guess(letter)
     @state = session['codeBreaker'].getGameStatus().join
     @guessed = session['codeBreaker'].getCode().include? letter
     if(!session['codeBreaker'].moreLives())
      erb :lost
     elsif(session['codeBreaker'].youWon())
      erb :win
     else
      erb :guessing
    end
  end
end
