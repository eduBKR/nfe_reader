## NfeReader ##

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

Open the xml file and import to NfeReader:

```ruby
file = File.open('sample-nfe.xml')
nfe = NfeReader::Base.read(file)
```

You can access class attributes:

```ruby
nfe.attributes

# {"version"=>"2.00", "signature"=> Hash, "enviroment"=>"1", "version_app"=>"SVRS20140825154650", "key"=>"42140979858221000155550010000483141000490912", "date"=>"2014-09-26T15:13:17", "protocol"=>"342140109891239", "digest"=>"v6ZkLNwbVB4lmk/PbND1kmr5tIY=", "status"=>"100", "description"=>"Autorizado o uso da NF-e.", "number"=>"NFe42140979858221000155550010000483141000490912"}
```

### Contributing

1. Fork it ( https://github.com/[my-github-username]/nfe-reader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
