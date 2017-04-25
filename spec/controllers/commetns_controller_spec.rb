require 'rails_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:comment){ build(:comment) }
  let(:missing_comment){ build(:comment, comment: '') }
  let(:comment_params){{ comment: comment.comment }}
  let(:comment_params_no_text){{ comment: ''}}

  describe 'indexアクションは' do
    before do
      login_user user
      get :index, group_id: group
    end

    it "インスタンス変数は期待した値になるか" do
      expect(assigns(:group)).to eq group
    end
    it "indexビューファイルに飛ぶか" do
      expect(response).to render_template :index
    end
  end

  describe 'createアクションは' do
    before do
      login_user user
    end

    it "インスタンス変数は期待した値になるか？" do
      post :create, group_id: group, comment: comment_params
      expect(assigns(:group)).to eq group
    end

    context 'commentが保存された時' do
      before do
        post :create, group_id: group, comment: comment_params
      end
      it 'グループ画面にリダイレクトすること' do
        expect(response).to redirect_to group_comments_path(group)
      end
      it 'フラッシュメッセージが出てくること' do
        expect(flash[:notice]).not_to be_empty
      end
      it '保存された時にCommentレコードの個数が増えるか' do
        expect(comment.save).to be_truthy
      end
    end

    context 'commentが保存されなかった時' do
      before do
        post :create, group_id: group, comment: comment_params_no_text
      end
      it 'グループ画面が呼び出されること' do
        expect(response).to render_template :index
      end
      it 'フラッシュメッセージが出てくること' do
        expect(flash[:alert]).not_to be_empty
      end
      it '保存されなかった時にCommentレコードの個数が増えない' do
        expect(missing_comment.save).to be_falsey
      end
    end
  end

end
