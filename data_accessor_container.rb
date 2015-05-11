class SuperClass
  attr_accessor :data

  def initialize
    @data = {}
  end

  def self.data_accessor(*args)
    args.each do |arg|
      define_method("#{arg}=") do |method_argument|
        data[arg] = method_argument
      end
      define_method(arg) do
        data[arg]
      end
    end
  end
end

class DataAccessorContainer < SuperClass
  data_accessor :foo
end
