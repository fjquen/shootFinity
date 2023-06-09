require 'gosu'


class Legion
    attr_accessor :tabLegion, :beamEnnemy, :nameFailed, :niveau_x, :niveau_y, :chgt_decor, :level_background
    def initialize
        @legion = Gosu::Image.new("media/enemyRed1.png", :tileable => true)
        @obj = {}
        @nameFailed = Array.new
        @tabLegion = Array.new
        @tabNameLegion = ["red","purple","black","blue","fushio","baba","elvis", "sidjey", "no_respect"]
        @chgt_decor = 0
        @level_background = [{"source"=>"media/blue.png","x"=>190,"y"=>100},{"source"=>"media/darkPurple.png","x"=>190,"y"=>100}]
    end

        
    def back_again_legion
      if @tabLegion.all? { |word| word["existence"] == false }
        @chgt_decor +=1
        @legion = Gosu::Image.new("media/enemyGreen3.png", :tileable => true)
         @tabLegion.map{|i| 
                            i['x']=rand(150..500)
                            i['y']= rand(100)
                            i['existence']=true 
                       }
      end
    end

    def create_legion_of_ennemy
        for n in 0..@tabNameLegion.length
            @tabLegion<<{
              'x'  => rand(150..600),
              'y' => rand(100),
              'existence'=>true,
              'name'=> @tabNameLegion[n]
              }
        end
    end
   
    def move_forward
      @tabLegion.length.times { |i|
        if @tabLegion[i]['y'] < 430
          @tabLegion[i]['y'] += 1
        else
          return @tabLegion[i]['y']
        end
      }
    end
   
    def draw(x,y)
      
       @legion.draw(x,y,0)
    end
end