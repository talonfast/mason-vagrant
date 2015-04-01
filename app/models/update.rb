class Update < ActiveRecord::Base
  def self.check_last
    delay = 2
    times = (60/delay) -1
    for i in 1..times do
      interval = 30 #Seconds
      last = Update.last
      difference = Time.now - last.created_at
      @hop = Hop.new
      if difference > interval
        @hop.up = false
      else
        @hop.up = true
      end
      @hop.save
      sleep delay
    end
  end
end