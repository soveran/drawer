require 'yaml'

class DrawerStore
  def self.load(file)
    YAML.load_file(file)
  end

  def self.save(object, file)
    File.open(file, 'w') do |f|
      YAML.dump(object, f)
    end
  end
end

class Drawer
  attr :cache

  def initialize(file, store = DrawerStore)
    @cache = store.load(file)

    at_exit do
      store.save(@cache, file)
    end
  end

  def get(k)
    cache[k]
  end

  def get_multi(*ks)
    ks.collect { |k| get(k) }
  end

  def set(k, v)
    cache[k] = v
  end

  def add(k, v)
    set(k, v) unless cache[k]
  end

  def remove(k)
    cache.delete(k)
  end

  def flush_all
    cache.clear
  end
end
