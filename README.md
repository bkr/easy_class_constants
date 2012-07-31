# EasyClassConstants

Gem adds class methods to create readable, writable and accessible constants.

## Installation

Add this line to your application's Gemfile:

    gem 'easy_class_constants'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_class_constants

## Usage

Adding constants to your class is easy:

    class ECCObject
      include EasyClassConstants
  
      readable_constant :read_only, 'R'
      writable_constant :write_only, 'W'
      accessible_constant :read_write, 'RW'
      hash_indexed_by_readable_constants(:mapping, [[:internal_error, 0, 'Internal Error - Try Again Later'],
                                              [:network_error, 1, 'Network Error - Check With Your Admin']])

      hash_indexed_by_readable_constants(:simple_mapping, [[:HELLO_WORLD, 'Hello World'],
                                              [:HELLO_KITTY, 'Hello Kitty']])
                                      
    end
    
Then you can call:

    ECCTestObject.INTERNAL_ERROR                 #will return 0
    ECCTestObject.SIMPLE_MAPPING[:HELLO_KITTY]   # will return 'Hello Kitty'
    ECCTestObject.SIMPLE_MAPPING.HELLO_KITTY     # will return 'Hello Kitty'
    ECCTestObject.READ_WRITE                     # will return 'RW'


# Credits

[Oha_extensions](https://github.com/bkr/oha_extensions) is maintained by [Bookrenter/Rafter](http://github.com/bkr) and is funded by [BookRenter.com](http://www.bookrenter.com "BookRenter.com").

![BookRenter.com Logo](http://assets0.bookrenter.com/images/header/bookrenter_logo.gif "BookRenter.com")

# Copyright

Copyright (c) 2012 Bookrenter.com. See LICENSE.txt for further details.