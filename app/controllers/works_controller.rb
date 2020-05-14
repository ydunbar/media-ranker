class WorksController < ApplicationController
    def index
        @works = Work.order(:category).all
    end

    def show
        work_id = params[:id]
        @work = Work.find_by(id: work_id)

        if @work.nil?
            head :not_found
            return
        end
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
