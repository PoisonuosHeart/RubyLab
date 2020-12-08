require 'rails_helper'

RSpec.describe "PagesControllers", type: :request do
    context PagesController, type: :controller do
        before(:all) do
            @rep = Report.create(tittle: 'Misha', description: 'Hacker')
            @rep.save
        end
        after(:all) do
            @rep.delete
        end
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 9}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 50}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 62}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 67}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 70}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 79}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 84}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 87}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 92}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: 95}}).to redirect_to(home_path)}
        it{expect(get :update, :params => {report_id: @rep.id, pages: {points: -8}}).to render_template('add_mark')} 
    end
end
