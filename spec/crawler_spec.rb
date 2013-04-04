describe 'crawler' do

  it 'should launch correctly' do
    crawler = GhostCrawler::Crawl.new('http://www.bensnape.com')
    crawler.crawl
  end
end

