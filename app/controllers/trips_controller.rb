class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
  def index
    @trips = current_user.trips.order(created_at: :desc)
  end

  def show
    @message = Message.new
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @message = Message.new
    if @trip.save
      redirect_to @trip

      initial_user_message = Message.create!(content: first_question, role: "user", trip: @trip)

      ruby_llm_chat = RubyLLM.chat
      ruby_llm_chat.add_message(initial_user_message)

      ai_response = ruby_llm_chat.with_instructions(assistant_context).ask(first_question)

      Message.create!(content: ai_response.content, role: "assistant", trip: @trip)

    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :origin, :destination, :start_date)
  end

   def first_question
    "Olá, eu quero ir de #{@trip.origin} para #{@trip.destination} na data #{@trip.start_date}. Poderia indicar o melhor caminho e a maneira mais fácil?"
  end

  def assistant_context
    "Você é um assistent de viagens local e tem as melhores recomendações com base nos interesses do usuário.
      O destino de #{@trip.user.first_name}} é #{@trip.destination}, a origem é #{@trip.origin}, porém a cada destino ele pode mudar a origem e o destino conforme suas sugestões.
      Responda com sugestões curtas mas diga os endereços exatos."
  end
end
