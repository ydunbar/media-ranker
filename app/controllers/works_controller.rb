class WorksController < ApplicationController
    before_action :find_work, only: [:show, :edit, :update, :destroy]

    def index
        @works = Work.all
        
    end

    def show; end

    def new
        @work = Work.new
    end

    def create
        @work = Work.new(work_params)
        if @work.save
            redirect_to work_path(@work)
            flash[:success] = "Successfully created #{@work.category} #{@work.id}"
        else
            render :new # show new work form again
            flash.now[:warning] = "A problem occurred: Could not create #{@work.category}"
        end
    end

    def edit; end

    def update
        if @work.update(work_params)
            redirect_to works_path
            flash[:success] = "Successfully updated #{@work.category} #{@work.id}"
        else # save failed :(
            render :edit
            flash.now[:warning] = "A problem occurred: Could not update #{@work.category}"
        end
    end

    def destroy
        @work.destroy
        redirect_to root_path
        flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"
    end

    private

    def work_params
        return params.require(:work).permit(:category, :title, :creator, :year, :description)
    end

    def find_work
        @work = Work.find_by_id(params[:id])
    end
end
