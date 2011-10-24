$:.unshift File.dirname($0)
require 'logger'
require 'ants.rb'

log = Logger.new("bot.txt")
ai=AI.new

ai.setup do |ai|
	# your setup code here, if any
end



#destinations=Array.new
directions=[:N, :E, :S, :W]

ai.run do |ai|

  ai.my_ants.each do |ant|
    
      #shuffle the direction array
      directions=directions.shuffle

      directions.each do |direction|
        futurDirection=ant.square.neighbor(direction)
        #if we can pass 
        if  futurDirection.land? #&& !destinations.include?(futurDirection)          
            log.debug(direction )
            #pass
    				ant.order direction 
            #store destination so you dont need to come back to it  
#            destinations << futurDirection
            break
        else
            log.warn("cant go #{direction}  #{futurDirection.row} , #{futurDirection.col}")
#            destinations << futurDirection                  
        end 

      end
   end
end





