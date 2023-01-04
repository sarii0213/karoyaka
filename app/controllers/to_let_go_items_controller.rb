class ToLetGoItemsController < ApplicationController
  def index
    @to_let_go_items = current_user.to_let_go_items
  end

  def show
    @to_let_go_item = current_user.to_let_go_items.find(params[:id])
  end

  def new
    @to_let_go_item = ToLetGoItem.new
  end

  def edit
    @to_let_go_item = current_user.to_let_go_items.find(params[:id])
  end

  def create
    @to_let_go_item = current_user.to_let_go_items.build(to_let_go_item_params)
    if @to_let_go_item.save
      redirect_to to_let_go_item_path(@to_let_go_item), notice: '手放したいものリストに登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @to_let_go_item = current_user.to_let_go_items.find(params[:id])
    if @to_let_go_item.update(to_let_go_item_params)
      redirect_to to_let_go_item_path(@to_let_go_item), notice: '手放したいものリストを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @to_let_go_item = current_user.to_let_go_items.find(params[:id])
    @to_let_go_item.destroy!
    redirect_to to_let_go_items_path, notice: '手放したいものリストから削除しました', status: :see_other
  end

  private

  def to_let_go_item_params
    params.require(:to_let_go_item).permit(:image, :category_id, :name, :reason_id)
  end
end
