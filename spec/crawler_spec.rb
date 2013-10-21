describe 'crawler' do

  before(:each) do
    @base_path = "file://#{File.dirname(__FILE__)}"
    @test_site = File.absolute_path 'spec/assets/index.html'
    @crawler = GhostCrawler::Crawler.new @test_site
  end

  it 'should visit the specified site first' do
    @crawler.unvisited_links.pop.should == @test_site
  end

  it 'should crawl all links in the initial page' do
    @crawler.crawl
    @crawler.visited_links.should include("#{@base_path}/assets/one.html")
  end

end

