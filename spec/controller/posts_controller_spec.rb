require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

    let(:post) {FactoryBot.create :post}

    describe 'GET index' do 
        it 'assigns @posts' do 
            get :index
            expect(assigns(:posts)).to eq([post])
        end

        it 'renders the index template' do 
            get :index
            expect(response).to render_template('index')
        end

        it 'returns the status code ok' do
            get :index
            expect(response).to have_http_status(:ok)
        end 
    end

    describe 'Post create' do 
        let(:faux_post) {FactoryBot.create :post}

        it 'should accept the params with html format' do
            post :create, params: {
                post_id: faux_post.id
            }
            expect(response.media_type).to eq('text/html')
            expect(response.content_type).to eq('text/html; charset=utf-8')
        end

        it 'should redirect to post showpage with html format' do
            post::create, params:{
                post_id: faux_post.id
            }
            expect(subject).to redirect_to(assigns(:faux_post))
        end
    end

end