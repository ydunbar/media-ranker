class VotesController < ApplicationController

    def create
        @vote = Vote.create(work_id: params[:id],user_id: session[:user_id])
        if session[:user_id] && @vote.valid?
            @vote.save
            redirect_back(fallback_location: :back)
        elsif @vote.valid? == false
            flash[:error] = "You have already voted for this work"
            redirect_back(fallback_location: :back)
        end
    end

end
