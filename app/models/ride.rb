class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets >= attraction.tickets
      if user.height >= attraction.min_height
        user.tickets = user.tickets - attraction.tickets
        user.nausea = user.nausea + attraction.nausea_rating
        user.happiness = user.happiness + attraction.happiness_rating
        return "Thank you for riding"
        redirect_to 'users/#{user.id}'
      else
        return "Sorry. You are not tall enough to ride the #{attraction.name}."
        redirect_to attractions_path
      end
    else
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      redirect_to attractions_path
    end
  end
end
