class PagesController < ApplicationController

  before_action :find_question, only: [:home, :abdv]
  before_action :authenticate, only: [:abdv, :scoreboard]
  

  def home
  end

  def abdv
    answer = params[:myAnswer]
    right_answer = @question.answer
   	if answer==right_answer
  		user = current_user
  		user.score = user.score+10
  		user.save!
	  	find_question
      myHash = Hash.new
      if @question == nil
        myHash["Statement"] = "XXX"
        myHash["Score"] = current_score
      else
        myHash["Statement"] = @question.statement
        myHash["Image"] = @question.image_url
        myHash["Score"] = current_score
      end
      myHash = myHash.to_json
  	else
      myHash = Hash.new
      myHash["Score"] = -1;
      myHash = myHash.to_json
    end
      respond_to do |format|
      format.html {}
      format.json { render json: myHash}
    end
  end
  
  def scoreboard
    @users=User.order(updated_at: :desc)
    @users=@users.sort_by(&:score).reverse
  end


  def error
    
  end
  
  private

  def find_question 
    if Question.exists?(id: current_score/10+1)
  	  @question = Question.find(current_score/10+1)
    else
      @question = nil
    end
  end

end
