class ArchivesController < ApplicationController


  def index
    @todays_pomodoros = Pomodoro.where(:user_id => current_user.id,
                                       :start_at => (DateTime.now.beginning_of_day..DateTime.now.end_of_day))
  end


end
