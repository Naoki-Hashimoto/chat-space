require 'rails_helper'

describe MessagesController, :type => :controller do

  let(:group) { create(:group) }
  let(:groups) { create_list(:group, 3) }
  let(:user) { create(:user) }
  let(:message) { create(:message) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it "@messageで新たなインスタンスを生成できているか" do
      get :index, group_id: group
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "indexアクションは正しく遷移するか？" do
      get :index, group_id: group
      expect(response).to render_template :index
    end
  end

  describe 'Post #create' do
    context "@messageが保存できた時" do
      it "データベースに値が保存される" do
        expect {
        post :create, message: attributes_for(:message), user_id: user, group_id: group
        }.to change(Message, :count).by(1)
      end

      it "正しいビューに遷移する" do
        post :create, message: attributes_for(:message), user_id: user, group_id: group
        expect(response).to redirect_to group_messages_path
      end
    end

    context "@messageが保存できなかった時" do
      it "データベースに値が保存されない" do
        expect {
        post :create, message: attributes_for(:message, body: ""), user_id: user, group_id: group
        }.to change(Message, :count).by(0)
      end

      it "正しいビューに遷移しない" do
        post :create, message: attributes_for(:message, body: ""), user_id: user, group_id: group
        expect(response).to render_template :index
      end
    end

  end


  describe 'before_action #set_group' do
    it "@groupは、配列に加えられているか？" do
      get :index, params: { group_id: group }
      expect(assigns(:group)).to eq group
    end
  end

end
