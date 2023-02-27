require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
 
    describe 'GET index' do 

        let(:post) {FactoryBot.create :post}
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
                post: {
                    title: "New Blog Post",
                    body: "Body of new Blog Post"
                }
            }
            expect(response.media_type).to eq('text/html')
            expect(response.content_type).to eq('text/html; charset=utf-8')
        end

        it 'should accept the params with json format' do
            post :create, params: {
                post: {
                    title: "New Blog Post",
                    body: "Body of new Blog Post"
                },
                format: :json
            }
            expect(response.media_type).to eq('application/json')
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        it 'should redirect to post showpage with html format' do
            post :create, params: {
                post: {
                    title: "New Blog Post",
                    body: "Body of new Blog Post"
                }
            }
            expect(subject).to redirect_to(assigns(:post))
        end
        it 'should render the show template with json format' do
            post :create, params: {
                post: {
                    title: "New Blog Post",
                    body: "Body of new Blog Post"
                },
                format: :json
            }
            expect(subject).to render_template("posts/show")
        end
    end

end