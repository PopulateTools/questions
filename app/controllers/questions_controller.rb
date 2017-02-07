class QuestionsController < ApplicationController
  def show
    @deck.questions.first
  end

  private

  def find_deck
    @deck = Deck.find_by!(slug: params[:deck_id])
  end
end
