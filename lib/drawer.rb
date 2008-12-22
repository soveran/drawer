require 'yaml'

class DrawerStore
  def self.load(file)
    YAML.load_file(File.expand_path(file))
  end

  def self.save(object, file)
    File.open(File.expand_path(file), 'w') do |f|
      YAML.dump(object, f)
    end
  end
end

class Drawer
  attr :cache
  attr :store

  def initialize(file, store = DrawerStore)
    @store = store
    @cache = store.load(file) || {}

    at_exit do
      save(file)
    end
  end

  def get(k)
    cache[k] or (set(k, yield) if block_given?)
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

  def inspect
    "Drawer count: #{cache.size}. Type 'cache' to view the content."
  end

  def save(file)
    store.save(@cache, file)
  end

  def self.open(file, &block)
    file = File.expand_path(file)
    drawer = Drawer.new(file)
    yield drawer if block_given?
    drawer
  end

  def self.open!(file)
    file = File.expand_path(file)
    create(file)
    open(file)
  end

  def self.create(file)
    unless File.exists?(file)
      FileUtils.mkdir_p File.dirname(file)
      FileUtils.touch(file)
    end
  end

  def self.remove(file)
    FileUtils.rm(file)
  end
end
