class PagesController < ApplicationController
    before_action :find_page, only: [:add_mark, :update]
    
    def create_report 
    end
    def update
        #@record.update({'mark': params[:pages][:mark]})
       @mrk = @record.marks.create(points: params[:pages][:points], letter: get_letter_mark(params[:pages][:points]))
        if @mrk.save
            redirect_to home_path
        else render 'add_mark'
        end
    end
    def add_mark
    end

    private def find_page
        @record = Report.find(params[:report_id])
    end
    def report_params
         params.require(:pages).permit(:points, :report_id, :letter)
    end

    private def get_letter_mark(mark)
        case mark.to_f
        when 0..49
            return 'F'
        when 50..54
            return 'D'
        when 55..59
            return "D+"
        when 60..64
            return "C-"
        when 65..69
            return 'C'
        when 70..74
            return "C+"
        when 75..79
            return "B-"
        when 80..84
            return 'B'
        when 85..89
            return "B+"
        when 90..94
            return "A-"
        when 95..100
            return "A"
        else return "Error"
        end
    end
end
