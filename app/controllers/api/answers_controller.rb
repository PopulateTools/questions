class Api::AnswersController < Api::ApplicationController
  before_action :find_deck, :find_question, :find_option

  def create
    @question.answers.create! user: current_user, option: @option
    render json: @question.reload.stats, status: :ok
  end

  private

  def find_deck
    @deck = Deck.find_by!(slug: params[:deck_id])
  end

  def find_question
    @question = @deck.questions.find_by!(id: params[:question_id])
  end

  def find_option
    @option = @question.options.find(params[:option_id])
  end
end
