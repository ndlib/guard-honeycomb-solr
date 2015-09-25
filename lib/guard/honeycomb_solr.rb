require 'guard'
require 'guard/guard'
require 'honeycomb_solr'

module Guard
  class HoneycombSolr < Guard
    def server
      @server ||= ::HoneycombSolr::Server.new
    end

    def start_honeycomb_solr
      server.start
    end

    def stop_honeycomb_solr
      server.stop
    end

    def restart_honeycomb_solr
      server.restart
    end

    # Called once when Guard starts. Please override initialize method to init stuff.
    #
    # @raise [:task_has_failed] when start has failed
    # @return [Object] the task result
    #
    def start
      start_honeycomb_solr
    end

    # Called when `stop|quit|exit|s|q|e + enter` is pressed (when Guard quits).
    #
    # @raise [:task_has_failed] when stop has failed
    # @return [Object] the task result
    #
    def stop
      stop_honeycomb_solr
    end

    # Called when `reload|r|z + enter` is pressed.
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    #
    # @raise [:task_has_failed] when reload has failed
    # @return [Object] the task result
    #
    def reload
      restart_honeycomb_solr
    end

    # Default behaviour on file(s) changes that the Guard plugin watches.
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_change has failed
    # @return [Object] the task result
    #
    def run_on_changes(paths)
      restart_honeycomb_solr
    end
  end
end
