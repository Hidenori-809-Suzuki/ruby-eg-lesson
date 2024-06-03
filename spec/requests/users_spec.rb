require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #new" do
    before { get new_user_path }

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end

    it '新しいuserオブジェクトがビューに渡されること' do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      { user: {
        name: 'user',
        password: 'password',
        password_confirmation: 'password'
        }
      }
    end

    let(:invalid_params) do
      { user: {
        name: 'ユーザー1',
        password: 'password',
        password_confirmation: 'invalid_password'
        }
      }
    end

    context '正しいユーザー情報が渡ってきた場合' do
      it 'ユーザーが１人増えていること' do
        expect { post users_path, params: valid_params }.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトされること' do
        expect(post users_path, params: valid_params).to redirect_to(mypage_path)
      end
    end

    context 'パラメータに正しいユーザー名、確認パスワードが含まれていない場合' do
      before do
        post users_path, params: invalid_params, headers: { 'HTTP_REFERER' => 'http://localhost' }
      end

      # TODO RSpecエラーあり、解消すること
      it 'リファラーにリダイレクトされること' do
        expect(response).to redirect_to('http://localhost')
      end

      it 'ユーザー名のエラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include 'ユーザー名は、小文字英数字で入力してください'
      end

      it 'パスワードの確認エラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include 'パスワード（確認）とパスワードの入力が一致しません'
      end
    end
  end
end
