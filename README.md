## Nfe::Reader ##

Gem to open Brazilian NF-e XML and convert to Ruby classes.

### Installation

Add this line to your application's Gemfile:

    gem 'nfe-reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfe-reader

### Dependencies

* nokogiri

### Usage

Open the xml file and import to Nfe::Reader:

```ruby
file = File.open('sample-nfe.xml')
nfe = Nfe::Reader::Base.new(file)
```

### Contributing

1. Fork it ( https://github.com/[my-github-username]/nfe-reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
