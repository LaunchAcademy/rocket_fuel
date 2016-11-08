module RocketFuel
  module SystemCall
    def self.make(cmd)
      system(cmd)
    end
  end
end
