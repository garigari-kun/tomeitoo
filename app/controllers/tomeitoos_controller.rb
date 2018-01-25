#
# class PomodoroDefaultSetting
#   attr_accessor :pomodoro_timer, :short_break, :long_break
#
#   def initialize(pomodoro_time=25, short_break=5, long_break=15)
#     @pomodoro_time = pomodoro_time
#     @short_break = short_break
#     @long_break = long_break
#   end
#
# end


class TomeitoosController < ApplicationController
  helper :pomodoros

  def index
      @pomodoro_default_settings = {
        :pomodoro_time => 25,
        :short_break => 5,
        :long_break => 15
      }
  end

end
