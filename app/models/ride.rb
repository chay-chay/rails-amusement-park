class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride    
    if user.tickets < attraction.tickets && user.height < attraction.min_height
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets #.self(no need)
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
    
    else
        user.tickets = user.tickets - attraction.tickets
        user.happiness = user.happiness + attraction.happiness_rating
        user.nausea += attraction.nausea_rating
        user.save
    end
    end
    
end
