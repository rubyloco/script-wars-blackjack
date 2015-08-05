module ScriptWarsBlackjack
  class PlayerLoader
    def initialize(path)
      @path = path
    end

    def load
      Dir[@path + '/*.rb'].each { |p| require p }
    end

    def player_classes
      Players.constants.map { |c| Players.const_get(c) }
    end
  end
end
