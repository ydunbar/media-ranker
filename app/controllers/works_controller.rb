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
        @work = Work.find_by(id: params[:id])
        if @work.nil?
        head :not_found
        return
        end
    end

    def update
        @work = Work.find_by(id: params[:id])
        if @work.nil?
            head :not_found
            return
        elsif @work.update(work_params)
            redirect_to works_path
            return
        else # save failed :(
            render :edit
            return
        end
    end

    def destroy
        work_id = params[:id]
        @work = Work.find_by(id: work_id)
        if @work.nil?
            head :not_found
            return
        end
        @work.destroy
        redirect_to works_path
        return
    end

    private

    def work_params
        return params.require(:work).permit(:category, :title, :creator, :year, :description)
    end
end
