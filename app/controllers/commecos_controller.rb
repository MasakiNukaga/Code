class CommecosController < ApplicationController


  def create
    commeco = Commeco.new(comment: params[:commeco][:comment])
    User.find(current_user.id).commecos << commeco
    UserCode.find(params[:commeco][:user_code_id]).commecos << commeco

    commeco.save
    redirect_to controller: 'user_codes', action: 'show', id: commeco.user_code_id
  end

  def destroy
    commeco = Commeco.find(params[:id])
    commeco.delete
    redirect_to controller: 'user_codes', action: 'show', id: commeco.user_code_id
  end
end
