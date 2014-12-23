require "./blinkstick.rb"

puts "BlinkStick Fade"

class Fader

  attr_reader :stick

  def initialize
    @stick = BlinkStick.find_all.first
  end

  def run
    while true do
      fade_to random_color
      sleep 2
    end
  end

  private
  def random_color
    r = Random.new
    Color::RGB.new(r.rand(255), r.rand(255), r.rand(255))
  end

  def fade_to(final, fade_time=1)
    start = stick.color
    100.times do |perc|
      stick.color = final.mix_with(start, perc)
      sleep fade_time/100.0
    end
  end

end

Fader.new.run
