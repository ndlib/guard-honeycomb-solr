require 'guard'
require 'guard/guard'

module Guard
  class Jetty < Guard
    def jetty_config
      @jetty_config ||= Jettywrapper.load_config.merge(options)
    end

    def start_jetty
      Jettywrapper.start(jetty_config)
    end

    def stop_jetty
      Jettywrapper.stop(jetty_config)
    end

    def restart_jetty
      stop_jetty
      start_jetty
    end

    # Called once when Guard starts. Please override initialize method to init stuff.
    #
    # @raise [:task_has_failed] when start has failed
    # @return [Object] the task result
    #
    def start
      start_jetty
    end

    # Called when `stop|quit|exit|s|q|e + enter` is pressed (when Guard quits).
    #
    # @raise [:task_has_failed] when stop has failed
    # @return [Object] the task result
    #
    def stop
      stop_jetty
    end

    # Called when `reload|r|z + enter` is pressed.
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    #
    # @raise [:task_has_failed] when reload has failed
    # @return [Object] the task result
    #
    def reload
      restart_jetty
    end

    # Default behaviour on file(s) changes that the Guard plugin watches.
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_change has failed
    # @return [Object] the task result
    #
    def run_on_changes(paths)
      restart_jetty
    end
  end
end
