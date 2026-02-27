class MessagesController < ApplicationController
  before_action :set_trip
def index
    @messages = @trip.messages.order(:created_at)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)  # cria mensagem com content do form
    @message.trip_id = @trip.id

  if @message.save                         # tenta salvar no banco
    redirect_to trip_messages_path(@trip)
  else
    @messages = @trip.messages.order(:created_at)
    render :index, status: :unprocessable_entity
  end
end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
