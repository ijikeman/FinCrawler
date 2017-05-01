module Daemon
  class << self
    def run
      ::Process.daemon(true, true)
    end
  end
end
