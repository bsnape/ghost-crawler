require 'selenium-webdriver'

module GhostCrawler

  class Driver

    attr_reader :driver

    def initialize(server)
      @driver = Selenium::WebDriver.for(:remote, :url => server)
    end

    def exit
      @driver.exit
    end

    def take_screenshot
      @driver.save_screenshot "screenshot#{SecureRandom.rand(1000)}.png"
    end

  end
end
