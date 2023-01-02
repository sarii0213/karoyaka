class ToLetGoListsController < ApplicationController
  def index
    @to_let_go_lists = current_user.to_let_go_lists
  end

  def show
    @to_let_go_list = current_user.to_let_go_lists.find(params[:id])
  end

  def new
    @to_let_go_list = ToLetGoList.new
  end

  def edit
    @to_let_go_list = current_user.to_let_go_lists.find(params[:id])
  end

  def create
    @to_let_go_list = current_user.to_let_go_lists.build(to_let_go_list_params)
    if @to_let_go_list.save
      redirect_to to_let_go_list_path(@to_let_go_list), notice: '手放したいものリストに登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @to_let_go_list = current_user.to_let_go_lists.find(params[:id])
    if @to_let_go_list.update(to_let_go_list_params)
      redirect_to to_let_go_list_path(@to_let_go_list), notice: '手放したいものリストを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @to_let_go_list = current_user.to_let_go_lists.find(params[:id])
    @to_let_go_list.destroy!
    redirect_to to_let_go_lists_path, notice: '手放したいものリストから削除しました', status: :see_other
  end

  private

  def to_let_go_list_params
    params.require(:to_let_go_list).permit(:image, :category_id, :item, :reason_id)
  end
end
