module Admin
  class QuestionsController < ApplicationController
    # GET /questions
    # GET /questions.json
    def index
      @questions = Question.all
    end

    private

  end
end