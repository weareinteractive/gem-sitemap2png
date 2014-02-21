# sitemap2png

[![Gem Version](https://badge.fury.io/rb/sitemap2png.png)](http://badge.fury.io/rb/sitemap2png)

> Commandline tool to take screenshots of all pages defined through a sitemap.xml in different resolutions.

*Note: This tool uses [webkit2png](http://www.paulhammond.org/webkit2png/).*

## Installation

```
$ gem install sitemap2png
```

## Usage

The following tasks are available trough the command line.

```
Commands:
  sitemap2png help [COMMAND]          # Describe available commands or one specific command
  sitemap2png load SITEMAP PATH       # Load sitemap.xml & save screenshots
```

## Commands

### load

```
Usage:
  sitemap2png load SITEMAP PATH

Options:
  -w, [--width=N]
                   # Default: 1024
  -d, [--delay=N]
                   # Default: 0
```

## Example Usage

```
$ sitemap2png load http://mysite.com/sitemap.xml /path/to/destination -w 1900
```

## Development

When developing you can use the given `rake` tasks:

```
$ rake -T
rake build    # Build sitemap2png-0.1.0.gem into the pkg directory.
rake install  # Build and install sitemap2png-0.1.0.gem into system gems.
rake release  # Create tag v0.1.1 and build and push sitemap2png-0.1.0.gem to Rubygems```
```

## Contributing
[![I Love Open Source](http://www.iloveopensource.io/images/logo-lightbg.png)](http://www.iloveopensource.io/projects/52ee312487659fce66000052)

In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) 2013 We Are Interactive under the MIT license.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/weareinteractive/gem-sitemap2png/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
