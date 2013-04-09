class CodeBreaker

  def initialize(code, life)
	  @code = codeInCharArray(code)
	  @life = life
  end
  
  def getCode()
		return @code
  end
    
  def getLife()
    @life
  end
  
  def updateArray(array,letter)
    array_of_guessed = array
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
  
  def guess(array,letter)
    answerGuess = array
    if(isALetter(letter))
      if(getCode.include?(letter))
        answerGuess = updateArray(array,letter)
      else
        @life -=1
      end
    else
      puts "only letters please"
    end
   return answerGuess
  end
 
  def codeInCharArray(code)
    charArray = []
	code.each_byte do |c|
	  charArray << c.chr
	end
   return charArray
  end
end

code_breaker = CodeBreaker.new("home",5)
#puts code_breaker.isALetter('*')
#array = Array.new(code_breaker.getCode.length,"*")
#print code_breaker.guess(array,'h')
#puts()
#print code_breaker.guess(array,'o')
#puts()
#print code_breaker.guess(array,'m')
#puts()
#print code_breaker.guess(array,'e')
