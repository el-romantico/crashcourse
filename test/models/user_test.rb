require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should find first name' do
    first_name, last_name = 'a', 'b'
    user = users(:root)
    user.name = "#{first_name} #{last_name}"
    assert_equal(user.first_name, first_name)
  end

  test 'should validate that names are delimited by space' do
    user = User.new(name: 'de')
    assert user.invalid?
  end

  test 'should validate that names contain only letters' do
    user = users(:root)
    user.name = 'antonio javaldi'
    assert user.valid?

    user.name = 'alex& lennon'
    assert user.invalid?
  end
end
