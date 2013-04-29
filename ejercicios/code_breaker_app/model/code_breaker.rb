class CodeBreaker

  def initialize(code, life)
	  @code = codeInCharArray(code)
	  @life = life
	  @gameStatus = Array.new(@code.length,"*")
  end
  
  def getCode()
	return @code
  end
    
  def getLife()
    @life
  end
  
  def getGameStatus()
    return @gameStatus
  end
  
  def setGameStatus(ags)
    @gameStatus = ags
  end
  
  def updateArray(letter)
    array_of_guessed = getGameStatus()
    for index in 0..getCode().length-1
      if(letter == getCode[index])
        array_of_guessed[index] = letter
      end
    end
    return array_of_guessed
  end
  
  def isALetter(let)
    return (let.downcase.ord >= 'a'.ord) && (let.downcase.ord <= 'z'.ord) 
  end
  
  def moreLives()
    getLife() > 0
  end
  
  def youWon()
    !getGameStatus().include? "*"
  end
  
  def stateOfWord(array)
    array
  end
  
  def guess(letter)
   answerGuess = getGameStatus()
    if(moreLives())
      if(isALetter(letter))
        if(getCode.include?(letter))
          answerGuess = setGameStatus(updateArray(letter))
          if youWon()
            puts "you won"
          end
        else
          @life -=1
        end
      else
        puts "only letters please"
      end
    else
      puts "no more lives, start again"
    end
    return answerGuess
  end
 
  def codeInCharArray(code)
    charArray = []
	code.split("").each do |c|
	  charArray << c
	end
   return charArray
  end
end

#code_breaker = CodeBreaker.new("home",5)
#puts code_breaker.isALetter('*')
#array = Array.new(code_breaker.getCode.length,"*")
#print code_breaker.guess('h')
#puts code_breaker.getGameStatus().join()
#puts()
#print code_breaker.guess('c')
#puts()
#print code_breaker.guess('m')
#puts()
#print code_breaker.guess('e')
