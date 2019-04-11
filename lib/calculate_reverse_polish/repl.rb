require 'core'

module REPL
  class << self
    def run(client: nil)
      @core = Core.new

      catch_signals

      loop do
        repl('>')
      end
    end

    private

    def catch_signals
      # Trap ^C
      Signal.trap("INT") { stop }

      # Trap `Kill`
      Signal.trap("TERM") { stop }
    end

    def stop
      puts 'Stoped...'
      exit
    end

    def repl(prompt)
      print prompt
      handle_input(gets.chomp!)
    end

    def handle_input(input)
      result = @client.process(input)
      puts "#{result}"

    rescue StandardError => err
      pust "ERROR: #{err}"
    end
  end
end