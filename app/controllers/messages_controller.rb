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
    # ai_response = RubyLLM.chat.ask(
    #   "Você é um assistente de viagens.
    #   Trip: #{@trip.destination}.
    #   Mensagem: #{@message.content}.
    #   Responda com sugestões curtas."
    # ).content


    # Message.create!(
    #   content: ai_response,
    #   role: "assistant",
    #   trip: @trip
    # )

    ruby_llm_chat = RubyLLM.chat
    @trip.messages.each do |message|
      ruby_llm_chat.add_message(message)
    end

    ai_response = ruby_llm_chat.with_instructions(assistant_context).ask(@message.content)

    Message.create!(content: ai_response.content, role: "assistant", trip: @trip)

    redirect_to trip_messages_path(@trip)

  else
    @messages = @trip.messages.order(:created_at)
    render :index, status: :unprocessable_entity
  end
end

  private

  def build_conversation_history
    @ai_response.each do |message|
      @ruby_llm_chat.add_message(message)
    end
  end

  def assistant_context
    "Você é um assistent de viagens local e tem as melhores recomendações com base nos interesses do usuário.
      O destino de #{@trip.user.first_name}} é #{@trip.destination}, a origem é #{@trip.origin}, porém a cada destino ele pode mudar a origem e o destino conforme suas sugestões.
      Responda com sugestões curtas mas diga os endereços exatos."
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
