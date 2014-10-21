module RocketFuel
  class CommandLineIcon
    def initialize(icon, fallback = '')
      @icon, @fallback = icon, fallback
    end

    def render
      fallback? ? @fallback : @icon
    end

    #we must handle for ruby 1.8 without iconv
    def fallback?
      !@icon.respond_to?(:encode)
    end
  end
end
