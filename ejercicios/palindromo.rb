require 'test/unit'

class Frase
	def es_palindromo(unString)
		 return unString.split.join.downcase().eql?(unString.split().join().downcase().reverse())
	end
end

class FraseTest < Test::Unit::TestCase
	def test_verificar_que_NO_es_palindromo
		f = Frase.new()
		assert_equal(false,f.es_palindromo("me encanta programar"))
	end
	def test_verificar_que_ES_palindromo
		f = Frase.new()
		assert_equal(true,f.es_palindromo("a la manuela dale una mala"))
	end
end

