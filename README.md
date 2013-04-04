# GhostCrawler

A lightweight web crawler that uses the Ghost Driver implementation of the WebDriver Wire Protocol from the PhantomJS
project.

## Pre-requisites

### PhantomJS Installation

Download and install PhantomJS and make sure it is on your `PATH`.

#### Mac

It is recommended you install using homebrew.

    $ brew update && brew install phantomjs

Then check it is on your `PATH`.

    $ which phantomjs
    /usr/local/bin/phantomjs

#### Windows

Currently untested and unsupported.

#### Linux

Currently untested and unsupported.

### Run PhantomJS

Make sure PhantomJS is running on port 9134.

    $ phantomjs --webdriver=9134
    PhantomJS is launching GhostDriver...
    [INFO  - 2013-04-03T18:00:47.747Z] GhostDriver - Main - running on port 9134

## Gem Installation

Add this line to your application's Gemfile:

    gem 'ghost-crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ghost-crawler

## Usage

TODO: Write usage instructions here

## Roadmap

1. bin directory
2. command line arguments
3. website dependency graph
4. screenshot image diffing

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
