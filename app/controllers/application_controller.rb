class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseのコントローラーから呼び出された場合は、「configure_permitted_parameters」メソッドが呼ばれる

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # ストロングパラメータに該当する機能です。サインアップ時に入力された「name」キーの内容の保存を許可しています。
end