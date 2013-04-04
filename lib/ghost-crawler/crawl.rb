require 'set'

module GhostCrawler

  class Crawl < Driver

    def initialize(site, server = 'http://localhost:9134')
      @site = site
      @unvisited_links = Queue.new
      @visited_links = Set.new
      super(server)
    end

    def crawl
      @unvisited_links.push @site

      start_page = @unvisited_links.pop
      @driver.navigate.to start_page
      get_links_on_page

      until @unvisited_links.empty?
        link = @unvisited_links.pop
        puts "navigating to: #{link} | still got #{@unvisited_links.size} to visit"
        puts '------------------'

        @driver.navigate.to link
        @visited_links.add link
        get_links_on_page
      end
      puts "visited the following #{@visited_links.size} links:"
      @visited_links.each { |link| puts link }
    end

    def get_links_on_page
      elements = Set.new @driver.find_elements(:tag_name => 'a')
      elements.delete_if { |e| !e.displayed? }
      urls = elements.map { |element| element.attribute('href') }
      urls.each { |url| @unvisited_links.push url }
    end

  end
end
