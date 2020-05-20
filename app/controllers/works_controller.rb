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
        @work = Work.new
    end

    def create
        @work = Work.new(work_params)
        if @work.save
            redirect_to root_path
            return
        else
            render :new # show new work form again
            return
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def work_params
        return params.require(:work).permit(:category, :title, :creator, :year, :description)
    end
end
