class RoomsController < ApiController
  before_action :set_room, only: %i[show]

  def index
    @rooms = Room.online.order(id: :desc)
  end

  def show; end

  def create
    @room = Room.new(room_params) do |room|
      room.creater_ip = request.remote_ip
      room.stream_ip = request.remote_ip
    end
    if @room.save
      render :show, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find_by!(key: params[:key])
  end

  def room_params
    params.require(:room).permit(:webhook)
  end
end
