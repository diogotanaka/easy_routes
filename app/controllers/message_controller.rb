class MessagesController < ApplicationController
  before_action :set_trip
def index
    @messages = @trip.messages.order(:created_at)
    @message = Message.new
  end
