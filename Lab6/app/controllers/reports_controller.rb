class ReportsController < ApplicationController
    before_action :find_report, only: [:show]

    def index
        @report = Report.all
        #@mark = Mark.all
    end

    def new
    end

    def show
    end

    def create
        #render plain: params[:reports].inspect
        @report = Report.new(report_params)
        if @report.save
            redirect_to home_path
        else render 'pages/create_report'
        end
        # @mark = Mark.new(report_params)
        # @mark.save
        # @report = @mark.reports.create()
        # if @mark.save
        #     redirect_to home_path
        # else render plain: params[:reports].inspect
        # end
    end

    def destroy
        @report = Report.find(params[:report_id])
        @report.destroy
        redirect_to home_path
    end

    private def report_params
        params.require(:reports).permit(:tittle, :description)
    end
    def find_report
        @report = Report.find(params[:id])
    end
end
