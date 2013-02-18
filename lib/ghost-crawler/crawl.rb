require 'set'
require 'selenium-webdriver'

module GhostCrawler

  class Crawl

    def initialize(server='http://localhost:9134', website='http://google.com')
      @driver = Selenium::WebDriver.for(:remote, :url => server)
      @driver.navigate.to website
    end

    def harvest_links
      elements = Set.new
      elements << @driver.find_elements(:tag_name => 'a')
      elements.delete_if { |e| e.text.empty? }
      elements
    end

    def take_screenshot
      @driver.save_screenshot "screenshot#{SecureRandom.rand(1000)}.png"
    end

    def exit
      @driver.exit
    end

  end
end
