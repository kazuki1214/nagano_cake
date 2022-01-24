class Admin::ApplicationsController < ApplicationController
  # admin傘下のコントローラーの継承元をこのコントローラーに変更する事でadminにログインしないと遷移できないようにしている
  before_action :authenticate_admin!

end
