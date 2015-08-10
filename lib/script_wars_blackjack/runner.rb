module ScriptWarsBlackjack
  class Runner
    def initialize(player_names, logger = Logger.new(STDOUT))
      @dealer = Dealer.new
      @player_names = player_names
      @logger = logger
    end

    def setup_players
      @player_names.each { |n| @dealer.add_player(n) }
      @logger.info "Starting a table with: #{@player_names.join(', ')}"
    end

    def start
      setup_players
      while @dealer.valid_table?
        gather_bets
        take_starting_cards
        take_moves
        ensure_dealer_min
        calculate_payouts
      end
      display_results
    end

    private

    def gather_bets
      @dealer.players_not_bust.each do |player|
        state = GameState.new(player.clone, @dealer.hand.clone)
        player.make_bet(state)
        @logger.debug "#{player.name} bet '#{player.current_bet}'"
      end
    end

    def take_starting_cards
      @logger.debug "Dealing starting cards"

      deal_card_to(@dealer)

      2.times do
        @dealer.players_not_bust.each do |player|
          deal_card_to(player)
        end
      end

      deal_card_to(@dealer)
    end

    def deal_card_to(object)
      card = @dealer.deck.draw
      @logger.debug "#{object.name} got a '#{card.name}'"
      object.deal(card)
    end

    def take_moves
      @dealer.players_not_bust.each do |player|
        state = GameState.new(player.clone, @dealer.hand.clone)
        case player.take_turn(state)
        when :flip_table
          @logger.info "#{player.name} flipped the table '(╯°□°）╯︵ ┻━┻'"
          @logger.info "#{player.name} gave up..."
          player.give_up
        when :stand
          @logger.debug "#{player.name} stood"
        when :hit
          card = @dealer.deck.draw
          deal_card_to(player)

          if player.hand.over?
            @logger.debug "#{player.name} busted"
          else
            redo
          end
        end
      end
    end

    def ensure_dealer_min
      @logger.debug "Ensuring dealer's hand >= 17"
      if @dealer.best_hand < 17
        deal_card_to(@dealer)
      end
    end

    def calculate_payouts
      @dealer.players_not_bust.each do |player|
        @logger.debug "Dealer best hand: #{@dealer.best_hand}"
        @logger.debug "#{player.name}'s' best hand: #{player.best_hand}"
        unless player.hand.over?(@dealer.best_hand)
          player.win_bet
        else
          player.forfit_bet
        end
        player.reset_hand
      end
      @dealer.reset_hand
      @dealer.reset_deck
    end

    def display_results
      winner = @dealer.winner
      if winner
        @logger.info "#{winner.name} won with '#{winner.bank}'"
      else
        @logger.info "The house wins"
      end
    end

  end
end
