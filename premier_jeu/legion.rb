require 'gosu'

class Legion < Gosu::Window
    attr_accessor :tabLegion, :beamEnnemy, :nameFailed, :niveau_x, :niveau_y
    def initialize
        @legion = Gosu::Image.new("media/ennemy.bmp", :tileable => true)
        @start_time=Gosu.milliseconds
        @obj = {}
        @nameFailed = Array.new
        @tabLegion = Array.new
        @tabNameLegion = ["red","purple","black","blue","fushio"]

    end

    def back_again_legion
      if @tabLegion.all? { |word| word["existence"] == false }
         @tabLegion.map{|i| 
                            i['x']=rand(150..500)
                            i['y']= rand(100)
                            i['existence']=true 
                        }
      end
    end
    def create_legion_of_ennemy
        for n in 0..5
            @tabLegion<<{
              'x'  => rand(150..400),
              'y' => rand(100),
              'color'=> Gosu::Color::RED.dup,
              'existence'=>true,
              'name'=> @tabNameLegion[n]
              }
        end
    end

    def move_forward
      @tabLegion.length.times { |i|
        if @tabLegion[i]['y'] < 400
          @tabLegion[i]['y'] += 1
        else
          return @tabLegion[i]['y']
        end
      }
    end
    

    def draw(x,y,color)
       @legion.draw(x,y,0,1,1,color)
    end
end