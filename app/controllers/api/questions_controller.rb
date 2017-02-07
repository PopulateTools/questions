class Api::QuestionsController < Api::ApplicationController
  before_action :find_deck

  def show
    @question = @deck.questions.pending_for_user(current_user)
    if @question.nil?
      head :no_content
    end
  end

  private

  def find_deck
    @deck = Deck.find_by!(slug: params[:deck_id])
  end
end
