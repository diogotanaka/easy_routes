class MessagesController < ApplicationController
  before_action :set_trip
  def index
    @trip = Trip.find(params[:trip_id])
    @messages = @trip.messages.order(:created_at)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.trip = @trip
    @message.role = "user"

  if @message.save
    ai_response = RubyLLM.chat.ask(
      "Você é um assistente de viagens.
      Trip: #{@trip.destination}.
      Mensagem: #{@message.content}.
      Responda com sugestões curtas."
    ).content


    Message.create!(
      content: ai_response,
      role: "assistant",
      trip: @trip
    )

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
