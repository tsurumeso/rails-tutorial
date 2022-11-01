require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference "User.count" do
      post users_path, params: {
        user: {
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end
  end

  test "valid signup information" do
    assert_difference "User.count", 1 do
      post users_path, params: {
        user: {
          name: "example",
          email: "user@example.com",
          password: "0123456789",
          password_confirmation: "0123456789"
        }
      }
    end
  end
end
