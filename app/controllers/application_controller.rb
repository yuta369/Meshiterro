class ApplicationController < ActionController::Base
  # ログイン認証されていなければ、ログイン画面へリダイレクトする [top以外]
  before_action :authenticate_user!, except: [:top]

  # deviseのストロングパラメータの編集
  # devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にどこに遷移するかを設定するメソッド(Userのインスタンス)
  def after_sign_in_path_for(resource)
    # Aboutページ
   post_images_path
  end

  # サインアウト後にどこに遷移するかを設定するメソッド
  def after_sign_out_path_for(resource)
    # Aboutページ
    about_path
  end

  # 呼び出された他のコントローラからも参照することができる
  protected

  # configure_permitted_parametersメソッド
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permitメソッドを使うことでユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
