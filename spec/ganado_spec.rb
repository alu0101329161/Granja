RSpec.describe Granja do
    describe Granja::Ganado do

        before :each do
          @test1 = Granja::Ganado.new("1111",284,:macho,9000.01,:bovino,:carne,:herbívoro)
          @test2 = Granja::Ganado.new("2222",285,:macho,9050.02,:porcino,:piel,:omnívoro)
          @test3 = Granja::Ganado.new("3333",286,:hembra,7000.03, :ovino,:leche,:herbívoro)
          @test4 = Granja::Ganado.new("4444",287,:hembra,5000.04,:caprino,:carne,:herbívoro)
        end

        context "Atributos de la clase Ganado" do
            it "Tiene una clase para representar ganado" do
                expect(Granja::Ganado.new()).not_to be(nil)
            end
            it "Tiene un atributo para la raza" do
                expect(@test1.raza).to eq(:bovino)
                expect(@test2.raza).to eq(:porcino)
                expect(@test3.raza).to eq(:ovino)
                expect(@test4.raza).to eq(:caprino)
            end
            it "Tiene un atributo para el tipo de aprovechamiento " do
                expect(@test1.aprovechamiento).to eq(:carne)
                expect(@test2.aprovechamiento).to eq(:piel)
                expect(@test3.aprovechamiento).to eq(:leche)
                expect(@test4.aprovechamiento).to eq(:carne)
            end
            it "Tiene un atributo para su tipo de alimentacion " do
                expect(@test1.alimentacion).to eq(:herbívoro)
                expect(@test2.alimentacion).to eq(:omnívoro)
                expect(@test3.alimentacion).to eq(:herbívoro)
                expect(@test4.alimentacion).to eq(:herbívoro)
            end
            it "Se obtiene una cadena con la informacion del ganado correctamente formateada" do
                expect(@test1.to_s).to eq("La cabeza de ganado de raza bovino con aprovechamiento tipo carne y herbívoro")
                expect(@test2.to_s).to eq("La cabeza de ganado de raza porcino con aprovechamiento tipo piel y omnívoro")
                expect(@test3.to_s).to eq("La cabeza de ganado de raza ovino con aprovechamiento tipo leche y herbívoro")
                expect(@test4.to_s).to eq("La cabeza de ganado de raza caprino con aprovechamiento tipo carne y herbívoro")
            end
        end

        context "Herencia de la clase Ganado" do
            it "Se espera que una instancia de la clase Ganado sea un Ganado" do
                expect(@test1).to be_a_kind_of (Granja::Ganado)
                expect(@test2).to be_a_kind_of (Granja::Ganado)
                expect(@test3.is_a? Granja::Ganado).to eq(true)
                expect(@test4.is_a? Granja::Ganado).to eq(true)
            end
            it "Se espera que una instancia de la clase Ganado sea un Animal" do
                expect(@test1).to be_a_kind_of (Granja::Animal)
                expect(@test2).to be_a_kind_of (Granja::Animal)
                expect(@test3.is_a? Granja::Animal).to eq(true)
                expect(@test4.is_a? Granja::Animal).to eq(true)
            end
            it "Se espera que una instancia de la clase Ganado sea un objeto" do
                expect(@test1.is_a? Object).to eq(true)
                expect(@test2.is_a? Object).to eq(true)
                expect(@test3.is_a? Object).to eq(true)
                expect(@test4.is_a? Object).to eq(true)
            end
            it "Se espera que una instancia de la clase Ganado sea un objeto basico " do
                expect(@test1.is_a? BasicObject).to eq(true)
                expect(@test2.is_a? BasicObject).to eq(true)
                expect(@test3.is_a? BasicObject).to eq(true)
                expect(@test4.is_a? BasicObject).to eq(true)
            end
            it "No se espera que una instancia de la clase Ganado sea una cadena" do
                expect(@test1).not_to be_a_kind_of (String)
                expect(@test2.is_a? String).to eq(false)
                expect(@test3.is_a? String).to eq(false)
                expect(@test3.is_a? String).to eq(false)
            end
            it "No se espera que una instancia de la clase Ganado sea un numero" do
                expect(@test1).not_to be_a_kind_of (Numeric)
                expect(@test2.is_a? Numeric).to eq(false)
                expect(@test3.is_a? Numeric).to eq(false)
                expect(@test4.is_a? Numeric).to eq(false)
            end
        end

        context "Comparable" do
            it "Existe un módulo comparable" do
                expect(Granja::Ganado).is_a?(Comparable)
            end
            it "ganado1 < ganado2" do  
                expect(@test1 < @test2).to eq(true)
                expect(@test2 < @test3).to eq(true)
            end
            it "ganado1 <= ganado2" do  
                expect(@test1 <= @test2).to eq(true)
                expect(@test3 < @test4).to eq(true)
            end
            it "ganado1 > ganado2" do  
                expect(@test2 > @test1).to eq(true)
                expect(@test3 > @test1).to eq(true)
            end
            it "ganado1 >= ganado2" do  
                expect(@test2 >= @test1).to eq(true)
                expect(@test3 > @test1).to eq(true)
            end
            it "ganado1 == ganado2" do  
                expect(@test3 == @test4).to eq(false)
                expect(@test1 == @test4).to eq(false)
            end
            it "ganado1 between(ganado2 y ganado3)" do  
                expect(@test3.between?(@test1,@test2)).to eq(false)
            end
          end
    
    end
end