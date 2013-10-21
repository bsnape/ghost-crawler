require 'set'
require 'selenium-webdriver'

module GhostCrawler

  class Crawler

    attr_reader :driver, :unvisited_links, :visited_links

    def initialize(site, server = 'http://localhost:9134')
      @site = site
      @unvisited_links = Queue.new
      @visited_links = Set.new
      @driver = Selenium::WebDriver.for(:remote, :url => server)
      @unvisited_links.push site
    end

    def crawl
      base_page = @unvisited_links.pop
      @driver.get base_page

      @visited_links.add base_page

      @unvisited_links.push get_links_on_page

      until @unvisited_links.empty?
        link = @unvisited_links.pop[0]
        @driver.get link
        @visited_links.add link
      end
    end

    def get_links_on_page
      elements = Set.new @driver.find_elements(:tag_name => 'a')
      elements.delete_if { |e| !e.displayed? } # remove hidden links
      elements.map { |element| element.attribute('href') }
    end

  end
end
