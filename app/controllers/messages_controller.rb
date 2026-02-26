class MessagesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @message = @trip.messages.create!(
      role: "user",
      content: params[:content]
    )

    # Resposta da IA (simplificado)
    @trip.messages.create!(
      role: "assistant",
      content: "Aqui está minha sugestão para #{@trip.destination}..."
    )

    redirect_to @trip
  end
end
