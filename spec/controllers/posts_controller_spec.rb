require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let (:user) {
    FactoryGirl.create(:user)
  }
  
  let(:valid_attributes) {
    { title: 'Superpost', body: 'jshd dgb', user_id: user.id, is_pinned: true, is_draft: true, 
      commentable: true }
  }

  let(:invalid_attributes) {
    { title: nil, body: nil, user_id: user.id, is_pinned: true, is_draft: true, commentable: true }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, params: {:id => post.to_param}, session: valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new, params: {}, session: valid_session
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :edit, params: {:id => post.to_param}, session: valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {:post => valid_attributes}, session: valid_session
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {:post => valid_attributes}, session: valid_session
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {:post => valid_attributes}, session: valid_session
        expect(response).to redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: {:post => invalid_attributes}, session: valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:post => invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: 'Superpost2', body: 'jshd dgb swf', user_id: user.id, is_pinned: true, is_draft: true, commentable: true}
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => new_attributes}, session: valid_session
        post.reload
        expect(assigns(:post)).to eq(post)
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}, session: valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}, session: valid_session
        expect(response).to redirect_to(post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => invalid_attributes}, session: valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! valid_attributes
        put :update, params: {:id => post.to_param, :post => invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {:id => post.to_param}, session: valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, params: {:id => post.to_param}, session: valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

end
