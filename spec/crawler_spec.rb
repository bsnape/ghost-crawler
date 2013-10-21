describe 'crawler' do

  it 'should visit the specified site first' do
    test_site = File.absolute_path 'spec/assets/index.html'
    crawler = GhostCrawler::Driver.new test_site
    crawler.unvisited_links.pop.should == test_site
  end

end

