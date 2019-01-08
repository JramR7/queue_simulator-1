class QueuesView

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



