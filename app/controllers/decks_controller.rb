class DecksController < ApplicationController
  def show
    @deck = Deck.find_by!(slug: params[:id])
  end
end
