Drawer
======

Ultra slim file-based cache.

Usage
-----

    require 'drawer'

    cache = Drawer.new('db/development.drawer')
    cache.get('foo')                #=> nil
    cache.set('foo', 123)
    cache.get('foo')                #=> 123
    cache.flush_all
    cache.get('foo')                #=> nil
    cache.set('bar', 456)
    cache.set('baz', 789)
    cache.get_multi('bar', 'baz')   #=> [456, 789]

An optional second parameter is a class to be used as the persistence layer.
By default, DrawerStore is used, but it can be replaced by any class that
provides load and save methods. For example:

    cache = Drawer.new(some_file, MyStoreClass)

Now, `MyStoreClass.load(some_file)` and `MyStoreClass.save(@cache, some_file)` will
be used for retrieving and saving the cached contents.

Installation
------------

    $ sudo gem install drawer

Copyright (c) 2008 Michel Martens.
Released under the MIT license.
