module GhostCrawler

  class Driver

    def phantomjs_path_check(name = 'phantomjs')
      raise 'phantomjs is not installed. Please see http://phantomjs.org/download.html' unless which("#{name}")
    end

    # Cross-platform way of finding an executable in the $PATH.
    def which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable? exe
        }
      end
      nil
    end

  end
end
