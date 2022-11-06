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
        'well done'
      else
        'not an english word'
      end
    else
      'not in the grid'
    end
  end

  def english_word?(word)
    # response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    # json = JSON.parse(response.read)
    # json['found']
    true
  end
