# ColorPoundSpecReporter

![](https://github.com/danielpclark/color_pound_spec_reporter/blob/master/example/color-output.png)

This reporter will work with minitest-reporters as far back as 0.14.24 for compatibility with testing older Rails versions.  Also works with current minitest-reporters version 1+.  Requires Ruby 1.9 or greater because of the string regex matching used.

## Installation

Add this to your application's Gemfile:

```ruby
gem 'minitest-reporters'
gem 'color_pound_spec_reporter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install color_pound_spec_reporter

## Usage

Add the following lines to your test helper file.
```ruby
require 'color_pound_spec_reporter'

Minitest::Reporters.use! [ColorPoundSpecReporter.new]
```

## Contributing

1. Fork it ( https://github.com/danielpclark/color_pound_spec_reporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The MIT License (MIT)

Copyright (c) 2015 Daniel P. Clark

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
