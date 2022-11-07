require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    attempt = params[:guess]
    grid = params[:grid]
    @result = run_game(attempt, grid)
  end

  # LONGEST WORD GAME
  # does 'guess' have same amount of char as grid
  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  # run game, return message
  def run_game(attempt, grid)
    score_and_message(attempt, grid)
  end

  def score_and_message(attempt, grid)
    if included?(attempt.upcase, grid)
      if english_word?(attempt)
        'Congratulations! Your word passes the test!'
      else
        'The word you submitted is not an english word. Try again.'
      end
    else
      'Sorry, it seems like you have used unvalid letters. Try again.'
    end
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
