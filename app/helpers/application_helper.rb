module ApplicationHelper
	def show
		
    @rooms = Room.all

    @friends = Friend.all
		
	end
end
