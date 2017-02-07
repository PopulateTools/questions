class DecksController < ApplicationController
  before_action :find_deck

  def show
  end

  def finished
  end

  private

  def find_deck
    @deck = Deck.find_by!(slug: params[:id])
  end
end
