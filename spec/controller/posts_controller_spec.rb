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
                post: post_params
            }
            expect(response.media_type).to eq('text/html')
            expect(response.content_type).to eq('text/html; charset=utf-8')
        end
        
        it 'should accept the params with json format' do
            post :create, params: {
                post: post_params,
                format: :json
            }
            expect(response.media_type).to eq('application/json')
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        it 'should redirect to post showpage with html format' do
            post :create, params: {
                post: post_params
            }
            expect(subject).to redirect_to(assigns(:post))
        end
        it 'should render the show template with json format' do
            post :create, params: {
                post: post_params,
                format: :json
            }
            expect(subject).to render_template("posts/show") 
        end

        it 'should render the validation error' do
            post :create, params: {
                post: {
                    title: nil,
                    body: "Body of new Blog Post"
                },
                format: :json
            }
            expect(assigns(:post).valid?).to_not eq(true)
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'should should include the error messages for empty attributes' do
            post :create, params: {
                post: {
                    title: nil,
                    body: "Body of new Blog Post"
                },
                format: :json
            }
            expect(assigns(:post).errors.full_messages).to include("Title can't be blank")
        end
    end

    describe 'Patch Update' do 
        let(:faux_post) {FactoryBot.create :post}
        let(:faux_post2) {FactoryBot.create :post}
        let(:faux_post3) {FactoryBot.create :post}

        it 'should accept the params with html format' do
            patch :update, params: {
                post: post_params,
                id: faux_post2.id
            }
            expect(response.media_type).to eq('text/html')
            expect(response.content_type).to eq('text/html; charset=utf-8')
        end

        it 'should accept the params with json format' do
            patch :update, params: {
                post: post_params,
                id: faux_post2.id,
                format: :json
            }
            expect(response.media_type).to eq('application/json')
            expect(response.content_type).to eq('application/json; charset=utf-8')
        end

        it 'should redirect to post showpage with html format' do
            patch :update, params: {
                post: post_params,
                id: faux_post2.id,
            }
            expect(subject).to redirect_to(assigns(:post))
        end
        it 'should render the show template with json format' do
            patch :update, params: {
                post: post_params,
                id: faux_post2.id,
                format: :json
            }
            expect(subject).to render_template("posts/show") 
        end

        it 'should render the validation error' do
            patch :update, params: {
                post: {
                    title: nil,
                    body: "Body of new Blog Post"
                },
                id: faux_post2.id,
                format: :json
            }
            expect(assigns(:post).valid?).to_not eq(true)
            expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'should should include the error messages for empty attributes' do
            patch :update, params: {
                post: {
                    title: nil,
                    body: "Body of new Blog Post"
                },
                id: faux_post2.id,
                format: :json
            }
            expect(assigns(:post).errors.full_messages).to include("Title can't be blank")
        end
    end

    describe 'DELETE Destroy' do
        let!(:faux_post) {FactoryBot.create(:post)}
        let!(:faux_post1) {FactoryBot.create :post}
    
        it 'should reduce the user count by one' do
            expect do
                delete :destroy, params: { id: faux_post.id, format: :json }
            end.to change(Post, :count).by(-1)
        
            expect(response).to be_successful
        end
    end

    def post_params
        {
            title: "New Blog Post",
            body: "Body of new Blog Post"
        }
    end
end