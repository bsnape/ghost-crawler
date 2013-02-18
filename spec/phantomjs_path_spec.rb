require 'rspec'
require 'ghost-crawler'

describe 'PhantomJS' do

  before(:each) do
    @driver = GhostCrawler::Driver.new
    @error = ''
  end

  it 'should raise an error if PhantomJS does not exist on the system path' do
    begin
      @driver.phantomjs_path_check 'ph4nt0mj5'
    rescue RuntimeError => e
      @error = e
    end
    @error.to_s.should == 'phantomjs is not installed. Please see http://phantomjs.org/download.html'
  end

  it 'should not raise an error if PhantomJS exists on the system path' do
    begin
      @driver.phantomjs_path_check
    rescue RuntimeError => e
      @error = e
    end
    @error.to_s.should == ''
  end


end
