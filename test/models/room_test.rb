require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  setup do
    Room.destroy_all
  end
  test 'should generate a slug' do
    room = Room.new
    room.name = 'Test'
    room.save
    assert_not_nil room.slug
  end

  test 'should generate a unique slug' do
    number_of_slugs = 10_000
    number_of_slugs.times do
      room = Room.new
      room.name = 'Test'
      room.save
    end
    Room.all.order(slug: :asc).each do |room|
      puts room.slug
    end
    assert_equal number_of_slugs, Room.all.count
  end
end
