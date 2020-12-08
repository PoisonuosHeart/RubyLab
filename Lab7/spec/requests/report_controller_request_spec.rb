require 'rails_helper'

RSpec.describe "ReportControllers", type: :request do
    context ReportsController, type: :controller do
        it{expect(get :index).to have_http_status(200)}
        it{expect(get :create, :params => {reports: {tittle: '', description: ''}}).to render_template('pages/create_report')}
        it{expect(get :create, :params => {reports: {tittle: 'Misha', description: 'Hacker'}}).to redirect_to(home_path)}
        it 'check destroy' do
            @rep = Report.create(tittle: 'Misha', description: 'Hacker')
            @rep.save
            expect(get :destroy, :params => {:report_id => @rep.id}).to redirect_to(home_path)
        end
    end
end
