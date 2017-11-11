# Implement `method_missing` in class Green to handle all methods that start with `green_`
# For all implemented methods `respond_to?` should return true.

class Green
  def method_missing(method_name, *args, &block)
    # handle all methods that start with `green_` and only them
  end

  def respond_to?(method_name, include_private = false)
    # should return true if method_name starts with `green_`
    # otherwise it depends wether method_name is defined in Object
  end
end


describe Green do
  subject { Green.new } # This line is optional. In RSpec default `subject` is `described_class.new`

  it "has any method that start with green_" do
    expect(subject.green_street).to eq(nil)
    expect(subject.green_town).to eq(nil)
  end

  it "hasn't more methods (expect methods from Object)" do
    expect { subject.blue_street }.to raise_error NoMethodError
    expect { subject.name }.to raise_error NoMethodError
    expect { subject.to_s }.not_to raise_error
  end

  it "respond_to returns true when method start with green_" do
    expect(subject.respond_to?(:green_street)).to eq(true)
    expect(subject.respond_to?(:green_town)).to eq(true)
  end

  it "respond_to returns false when method doesn't start with green_ and method not from Object" do
    expect(subject.respond_to?(:blue_street)).to eq(false)
    expect(subject.respond_to?(:name)).to eq(false)
    expect(subject.respond_to?(:to_s)).to eq(true)
  end
end
