require 'test_helper'
require 'generators/custom/custom_generator'

class CustomGeneratorTest < Rails::Generators::TestCase
  tests CustomGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
