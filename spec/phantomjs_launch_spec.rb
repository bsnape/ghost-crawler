describe 'PhantomJS' do

  before(:each) do
    @port = '9134'
  end

  it 'should launch correctly on a given port' do
    output = []
    IO.popen("phantomjs --webdriver=#@port", 'r') do |pipe|
      begin
        Timeout.timeout(10) do
          while (line = pipe.gets)
            line.chomp!.freeze
            output << line
            Process.kill('TERM', pipe.pid) if line == "Ghost Driver running on port #@port"
          end
        end
      rescue Timeout::Error
        output = 'error'
        Process.kill('TERM', pipe.pid)
      end
    end

    output[0].should == 'PhantomJS is launching GhostDriver...'
    output[1].should == "Ghost Driver running on port #@port"
  end

  it 'should produce an error for an unavailable port' do
    output = []
    IO.popen("phantomjs --webdriver=#@port", 'r') do |pipe|
      IO.popen("phantomjs --webdriver=#@port", 'r') do |pipe2|
        begin
          Timeout.timeout(10) do
            while (line = pipe2.gets)
              line.chomp!.freeze
              output << line
            end
            Process.kill('TERM', pipe2.pid)
            Process.kill('TERM', pipe.pid)
          end
        rescue Timeout::Error
          output = 'error'
          Process.kill('TERM', pipe.pid)
          Process.kill('TERM', pipe2.pid)
        end
      end
    end

    output[0].should == 'PhantomJS is launching GhostDriver...'
    output[1].should == 'Error: ERROR: Could not start Ghost Driver'
  end
end
