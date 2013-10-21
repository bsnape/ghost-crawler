require 'set'
require 'selenium-webdriver'

module GhostCrawler

  class Driver

    attr_reader :driver, :unvisited_links, :visited_links

    def initialize(site, server = 'http://localhost:9134')
      @site = site
      @unvisited_links = Queue.new
      @visited_links = Set.new
      @driver = Selenium::WebDriver.for(:remote, :url => server)
      @unvisited_links.push site
    end

    def take_screenshot
      @driver.save_screenshot "screenshot#{SecureRandom.rand(1000)}.png"
    end

    def crawl
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
      elements.delete_if { |e| !e.displayed? } # remove hidden links
      elements.map { |element| element.attribute('href') }
    end

  end
end
