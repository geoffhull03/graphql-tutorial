require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCAse
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  test 'create new link' do
    link = perform(
      url: 'http://example.com',
      description: 'description',
    )

    assert link.persisted?
    assert_equal link.description, 'description'
    assert_equal link.url, 'https://example.com'
  end
end
