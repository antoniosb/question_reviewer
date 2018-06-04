module Admin
  class QuestionsController < Admin::ApplicationController
    before_action :set_question, only: [:show, :edit, :update]
    # GET /questions
    # GET /questions.json
    def index
      @questions = Question.all
    end

    def edit
      @question.reviews.build
    end


    def update
      respond_to do |format|
        if @question.update_attributes(question_params)
          format.html {redirect_to admin_questions_path, notice: 'Question was successfully updated.'}
          format.json {render :index, status: :ok}
        else
          format.html {render :edit}
          format.json {render json: @question.errors, status: :unprocessable_entity}
        end
      end
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(
          default_question_attributes,
          reviews_attributes: default_review_attributes
      )
    end

    def default_question_attributes
      %i[user_id status]
    end

    def default_review_attributes
      %i[id comment]
    end
  end
end
