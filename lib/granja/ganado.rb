module Granja
    # Guardar los datos de las cabezas de ganado hereda de animal
    class Ganado < Animal
        
        include Comparable

        # @overload getter de los atributos
        attr_reader :raza, :aprovechamiento, :alimentacion

        # Constructor de la clase Ganado
        # @note se aceptan 7 parametro y se llama a super
        # @return inicializa atributos
        def initialize(iden = 0, edad = 0, sexo = "", peso = 0,raza = "", apro = "", ali = "")

            super(iden,edad,sexo,peso)
            if(raza == :bovino || raza == :porcino || raza == :ovino || raza == :caprino)
                @raza = raza
            else
                return nil
            end
            if(apro == :carne || apro == :piel || apro == :leche)
            @aprovechamiento = apro
            else
                nil
            end
            if(ali == :herbívoro || ali == :omnívoro)
            @alimentacion = ali
            else
                return nil
            end

        end

        # Metodo para convertir en string
        # @return String
        def to_s
            "La cabeza de ganado de raza #{@raza} con aprovechamiento tipo #{@aprovechamiento} y #{@alimentacion}"
        end

        # Metodo para comparar por edad
        # @return Bool
        def <=> other 
            @edad <=> other.edad
        end
        
        # Metodo para comparar por cualquier valor
        # @return Bool
        def > other
            if(other.instance_of? Ganado)
                @edad > other.edad
            else
                @edad > other
            end
        end

        # Metodo para comparar todos los valores
        # @return Bool
        def == other
            @raza == other.raza && @aprovechamiento == other.aprovechamiento && @alimentacion == other.alimentacion
        end

        # Metodo para sumar valor a edad
        # @return Ganado object
        def + other
            Ganado.new(@identificador, @edad, @sexo, @peso + other, @raza, @aprovechamiento, @alimentacion)
        end

    end
end