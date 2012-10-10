require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "it has a valid factory" do
    post = build(:post)
    assert(post.valid?)
  end

  test "it should generate a permalink automatically on save" do
    post = build(:post, :title => "This is A title", :permalink => nil)
    post.save!
    assert_equal("this-is-a-title", post.permalink)
  end

  test "it should not allow doubled permalinks" do
    post = create(:post, :title => "This is A title", :permalink => nil)
    post_doubled = build(:post, :title => "This is A title", :permalink => nil)
    assert_equal(post_doubled.valid?, false)
  end

end
