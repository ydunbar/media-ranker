class VotesController < ApplicationController

    def create
        @vote = Vote.new(work_id: params[:work_id],user_id: session[:user_id])
        
    end

end
