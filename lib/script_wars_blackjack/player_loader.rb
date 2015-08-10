module ScriptWarsBlackjack
  class PlayerLoader
    def initialize(path)
      @path = path
      load
    end

    def load
      Dir[@path + '/*.rb'].each { |p| require p }
    end

    def names
      Players.constants
    end

    def player_classes
      names.map { |c| Players.const_get(c) }
    end
  end
end
