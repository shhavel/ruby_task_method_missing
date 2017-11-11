class User
  attr_accessor :name, :email, :address, :age
end

class UserDecorator
  def initialize(user)
    @user = user
  end

  def name
    "NAME: #{@user.name}"
  end

  # define method_missing to delegate all user's methods to @user
  def method_missing(method_name, *args, &block)
    # handle all @user's methods
  end
end

describe UserDecorator do
  let(:user) do
    user = User.new
    user.name = "Dougal McGuire"
    user.email = "dougal.mcguire@example.com"
    user.age = 26
    user.address = "Glanquin, Glanquin kilnaboy, Ennis, Co. Clare, V95VY2F, Ireland"
    user
  end
  subject { UserDecorator.new(user) }

  it "decorates user's name" do
    expect(subject.name).to eq("NAME: Dougal McGuire")
  end

  it "delegates all other user's methods to @user" do
    expect(subject.email).to eq(user.email)
    expect(subject.age).to eq(user.age)
    expect(subject.address).to eq(user.address)
  end
end
