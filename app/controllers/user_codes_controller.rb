class UserCodesController < ApplicationController

  def index
    if params[:search].present?
      @user_codes = UserCode.search(params[:search]).page(params[:page]).per(10).order(:id)
    else
      @user_codes = UserCode.page(params[:page]).per(10).order(:id)
    end
    @code_language_map = Hash.new
    @user_codes_all = UserCode.all
    @user_codes_all.each do |code|
      if @code_language_map.has_key?(code.language)
        @code_language_map[code.language] += 1
      else
        @code_language_map[code.language] = 1
      end
    end
    @code_language_map.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }

    @codes_count = 0
    @code_language_map.each_value do |v|
      @codes_count += v
    end
  end

  def show
    @usercode = UserCode.find(params[:id])
    @code = @usercode[:source]
    @commecos = @usercode.commecos
  end

  def create
    code = UserCode.new(title: params[:user_code][:title], source: params[:user_code][:source],language: params[:user_code][:language], user_id: current_user.id)
    user = User.find(code.user_id)
    user.user_codes << code
    code.save
    user.save
    redirect_to action: 'index'
  end

  def destroy
    code = UserCode.find(params[:id])
    code.delete
    redirect_to action: 'index'
  end
end
