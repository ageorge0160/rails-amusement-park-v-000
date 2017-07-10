class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets < attraction.tickets && user.height <= attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      redirect_to attractions_path
    elsif user.height <= attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
      redirect_to attractions_path
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      redirect_to attractions_path
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      return "Thanks for riding the #{attraction.name}!"
      redirect_to 'users/#{user.id}'
    end
  end
end
