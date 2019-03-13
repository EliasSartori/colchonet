class RoomCollectionPresenter
  delegate :current_page, :num_pages, :limit_value, :total_pages, to: :@rooms
  def initialize(rooms, context)
    @rooms = rooms
    @context = context
  end
  def to_ary
    @rooms.map do |room|
      if room.user_id == @context.current_user.id
        RoomPresenter.new(room, @context, false)
      else
        RoomPresenter.new(room, @context, true)
      end
    end
  end
end