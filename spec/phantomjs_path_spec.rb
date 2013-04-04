describe 'PhantomJS' do

  before(:each) do
    @crawler = GhostCrawler::Crawl.new
  end

  it 'should return nil if PhantomJS does not exist on the system path' do
    @crawler.phantomjs_on_path?('ph4nt0mj5').should be_nil
  end

  it 'should not return nil if PhantomJS exists on the system path' do
    @crawler.phantomjs_on_path?.should_not be_nil
  end

end
