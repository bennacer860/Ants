$:.unshift File.dirname($0)
require 'logger'
require 'ants.rb'

log = Logger.new("bot.txt")
ai=AI.new

ai.setup do |ai|
	# your setup code here, if any
end

#ai.run do |ai|
#	# your turn code here
#	
#	ai.my_ants.each do |ant|
#		# try to go north, if possible; otherwise try east, south, west.
#		[:N, :E, :S, :W].each do |dir|
#			if ant.square.neighbor(dir).land?
#			  log.debug(dir)
#				ant.order dir
#				break
#			end
#		end
#	end
#end




#log.debug("gregregre")

destinations=Array.new
directions=[:N, :E, :S, :W]

ai.run do |ai|

  ai.my_ants.each do |ant|
    
      #pick a random destination
      direction=directions[rand(directions.length)]
    
      directions.each do |direction|
        futurDirection=ant.square.neighbor(direction)
        #if we can pass 
        if !destinations.include?(futurDirection) && futurDirection.land?
            log.debug(direction )
            #pass
    				ant.order direction 
            #store destination so you dont need to come back to it  
            destinations << futurDirection
            break
        else
            log.warn("was here #{direction}  #{futurDirection.row} , #{futurDirection.col}")
#            destinations << futurDirection      
            
        end 
      end
   end
end





#  def do_turn(self, ants):
#        destinations = []
#        for a_row, a_col in ants.my_ants():
#            # try all directions randomly until one is passable and not occupied
#            directions = AIM.keys()
#            shuffle(directions)
#            for direction in directions:
#                (n_row, n_col) = ants.destination(a_row, a_col, direction)
#                if (not (n_row, n_col) in destinations and
#                        ants.passable(n_row, n_col)):
#                    ants.issue_order((a_row, a_col, direction))
#                    destinations.append((n_row, n_col))
#                    break
#            else:
#                destinations.append((a_row, a_col))
