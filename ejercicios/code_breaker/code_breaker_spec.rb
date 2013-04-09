require 'rspec'
require_relative './code_breaker'

describe CodeBreaker do

  describe 'guess' do

    it 'should decrement life when fail' do
      code_breaker = CodeBreaker.new('home',5)
      array = Array.new(code_breaker.getCode.length,"*")
      initial_life = code_breaker.getLife()
      code_breaker.guess(array,'c')
      code_breaker.getLife.should eq initial_life-1
    end
    it 'should return an array with h as the first letter of the word and e as the last letter' do
      code_breaker = CodeBreaker.new('home',5)
      array = Array.new(code_breaker.getCode.length,"*")
      arrayTest = Array.new(code_breaker.getCode.length,"*")
      arrayTest[0] = 'h'
      arrayTest[3] = 'e'
      code_breaker.guess(array,'h')
      code_breaker.guess(array,'e').should eq arrayTest
    end
    it 'should return the same array when you guess wrong' do
      code_breaker = CodeBreaker.new('home',5)
      array = Array.new(code_breaker.getCode.length,"*")
      code_breaker.guess(array,'c')
      arrayTest = Array.new(code_breaker.getCode.length,"*")
      arrayTest[0] = 'h'
      code_breaker.guess(array,'h').should eq arrayTest
    end
 end
 
 describe 'isALetter' do
   
  it 'should return true if the passed parameter is a letter' do
    code_breaker = CodeBreaker.new('home',5)
    code_breaker.isALetter('Z').should eq true
  end
  it 'should return false if the passed parameter is not a letter' do
    code_breaker = CodeBreaker.new('home',5)
    code_breaker.isALetter('5').should eq false
  end
 end
end
