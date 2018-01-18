module PomodorosHelper
  def min_for_displaying(min)
    return "#{min}:00 min"
  end

  def min_for_timer(min)
    return "#{min}m00s"
  end
end
