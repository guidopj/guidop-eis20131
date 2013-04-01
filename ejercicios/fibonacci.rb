require 'test/unit'

class Numeros
  def es_de_fibonacci(unNumeroPorUsuario)
    numeroAComparar = 0
    numeroASumar1 = 1
    numeroASumar2 = 1
    esDeSerie = false
	if unNumeroPorUsuario == 1 || unNumeroPorUsuario == 0
	  esDeSerie = true
    else
      while numeroAComparar < unNumeroPorUsuario
	    numeroAComparar = numeroASumar1+ numeroASumar2
		numeroASumar1= numeroASumar2
		numeroASumar2 = numeroAComparar
		if(numeroAComparar == unNumeroPorUsuario)
			esDeSerie = true
		end
	  end
    end
  return esDeSerie
  end
end


class FibonacciTest < Test::Unit::TestCase
	def test_verificar_que_7_no_pertenece_a_la_secuencia
		f = Numeros.new
		assert_equal(false,f.es_de_fibonacci(7))
	end
	def test_verificar_que_34_pertenece_a_la_secuencia
		g = Numeros.new
		assert_equal(true,g.es_de_fibonacci(34))
	end
end
