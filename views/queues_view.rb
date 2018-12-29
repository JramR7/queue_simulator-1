class QueuesView

    attr_reader :numeroDeCajas, :modoDeFilas, :tiempoDeSimulacion, :tiempoDeEspera

    #Este método interactúa por consola con el usuario, actualizando el valor de los atributos con los datos ingresados por el usuario
    def leerComandos()
        ingresaNumeroValido = false;
        begin
            print "\nIngrese el número de cajas registradoras que tendrá su supermercado: "
            textoIngresado = gets.chomp
            if textoIngresado.is_integer? && textoIngresado.to_i > 0
                @numeroDeCajas = textoIngresado.to_i
                ingresaNumeroValido = true 
            else
                puts "\nDebe ingresar un número entero mayor a 0."
            end
         end while ingresaNumeroValido == false
        
        ingresaNumeroValido = false;
        begin
            puts "\nIngrese"
            puts " 1 Si desea que su supermercado sólo tenga una fila."
            puts " 2 Si desea que su suspermercado tenga múltiples filas."
            textoIngresado = gets.chomp
            if textoIngresado.is_integer? && (textoIngresado.to_i == 1 || textoIngresado.to_i == 2)
                @modoDeFilas = textoIngresado.to_i
                ingresaNumeroValido = true 
            else
                puts "\nDebe seleccionar alguna de las dos opciones."
            end
         end while ingresaNumeroValido == false

        ingresaNumeroValido = false;
        begin
            puts "\nIngrese el número de minutos que se deben simular."
            textoIngresado = gets.chomp
            if textoIngresado.is_integer? && textoIngresado.to_i >=1
                @tiempoDeSimulacion = textoIngresado.to_i
                ingresaNumeroValido = true 
            else
                puts "\nDebe ingresar un número entero mayor a 0"
            end
        end while ingresaNumeroValido == false

        ingresaNumeroValido = false;
        begin
            puts "\nFinalmente, ingrese el tiempo (en segundos) que debe esperar la simulación después de cada iteración antes de continuar a la siguiente."
            textoIngresado = gets.chomp
            if textoIngresado.is_integer? && textoIngresado.to_i >=1
                @tiempoDeEspera = textoIngresado.to_i
                ingresaNumeroValido = true 
            else
                puts "\nDebe ingresar un número entero mayor a 0"
            end
        end while ingresaNumeroValido == false
    end

    #Recibe como parámetro una matriz (que debe tener el formato que se muestra en el ejemplo al final de este documento) y la muestra por consola
    def mostrarEnConsola(matriz)
        for i in 0...matriz[0].length
            print "|C| "
        end
        print "\n"

        for i in 0...matriz[0].length
            print " "+matriz[0][i]+"  "
        end
        print "\n"

        largoMaximoDeFila = 0
        for i in 0...matriz[1].length
            if matriz[1][i].length > largoMaximoDeFila
                largoMaximoDeFila = matriz[1][i].length
            end
        end
        
        print "\n"

        for i in 0...largoMaximoDeFila
            for j in 0...matriz[1].length
                if matriz[1][j].length > i
                    print "|"+matriz[1][j][i]+"| "
                else
                    print "    "
                end
            end
            print "\n"
        end
        print "\n"
        
        if(@modoDeFilas==1)
            print "  (Fila única)\n\n"
        else
            print "  (Una fila por caja)\n\n"
        end
    end
end

#Agrego el método is_integer? a la clase String para facilitar la comprobación de datos en la vista
class String
    def is_integer?
        self.to_i.to_s == self
    end
end



=begin 
#Este código sirve para probar la funcionalidad de la clase QueuesView

lista = QueuesView.new()
lista.leerComandos()

print "\nPrueba del método mostrarEnConsola para un supermercado con múltiples cajas y filas.\n\n"

matrizMultiplesFilas = [["Q", "W", "E", "R", "P"]\
          ,\
          [["a", "b", "c", "d"],\
          ["z", "y", "x", "w", "v", "u", "t", "s"],\
          [],\
          ["n"],\
          ["r", "u", "e", "b", "a"]]]

lista.mostrarEnConsola(matrizMultiplesFilas)

print "\nPrueba del método mostrarEnConsola para un supermercado con múltiples cajas y una sola fila.\n\n"

matrizUnicaFila = [["Q", "W", "E", "R", "T"]\
          ,\
          [["a", "b", "c", "d","z", "y", "x", "w", "v", "u", "t", "s","n"]]]

lista.mostrarEnConsola(matrizUnicaFila) 
 =end



