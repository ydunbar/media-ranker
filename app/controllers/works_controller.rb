class WorksController < ApplicationController
    before_action :find_work, only: [:show, :edit, :update, :destroy]

    def index
        @works = Work.order(:category).all
    end

    def show; end

    def new
        @work = Work.new
    end

    def create
        @work = Work.new(work_params)
        if @work.save
            redirect_to root_path
        else
            render :new # show new work form again
        end
    end

    def edit; end

    def update
        if @work.update(work_params)
            redirect_to works_path
        else # save failed :(
            render :edit
        end
    end

    def destroy
        @work.destroy
        redirect_to works_path
    end

    private

    def work_params
        return params.require(:work).permit(:category, :title, :creator, :year, :description)
    end

    def find_work
        @work = Work.find_by_id(params[:id])
    end
end
