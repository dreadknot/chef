      def iterm
        begin
          require 'appscript'
        rescue LoadError
          STDERR.puts "you need the rb-appscript gem to use knife ssh iterm. `(sudo) gem install rb-appscript` to install"
          raise
        end

          Appscript.app("/Applications/iTerm 2.app").windows.first.activate
          Appscript.app("System Events").application_processes["iTerm 2.app"].keystroke("n", :using=>:command_down)
          term = Appscript.app('iTerm 2')
          window = term.terminals.last.get

        # (session.servers_for.size - 1).times do |i|
        #   window.activate 
        # end

        session.servers_for.each do |server|
          Appscript.app("System Events").application_processes["iTerm 2.app"].keystroke("t", :using=>:command_down)
          cmd = "unset PROMPT_COMMAND; echo -e \"\\033]0;#{server.host}\\007\"; ssh #{server.user ? "#{server.user}@#{server.host}" : server.host}"
          window.sessions.last.write(:text => cmd)
          sleep 1
        end

      end
