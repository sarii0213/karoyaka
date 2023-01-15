class DoneLettingGoItemsController < ApplicationController
  def index
    @done_letting_go_items = current_user.done_letting_go_items
  end

  def show
    @done_letting_go_item = current_user.done_letting_go_items.find(params[:id])
  end

  def new
    @done_letting_go_item = DoneLettingGoItem.new
  end

  def edit
    @done_letting_go_item = current_user.done_letting_go_items.find(params[:id])
  end

  def create
    @done_letting_go_item = current_user.done_letting_go_items.build(done_letting_go_item_params)
    if @done_letting_go_item.save
      redirect_to done_letting_go_item_path(@done_letting_go_item), notice: '手放し済みリストに登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @done_letting_go_item = current_user.done_letting_go_items.find(params[:id])
    if @done_letting_go_item.update(done_letting_go_item_params)
      redirect_to done_letting_go_item_path(@done_letting_go_item), notice: '手放し済みリストを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @done_letting_go_item = current_user.done_letting_go_items.find(params[:id])
    @done_letting_go_item.destroy!
    redirect_to done_letting_go_items_path, notice: '手放した済みリストから削除しました', status: :see_other
  end

  private

  def done_letting_go_item_params
    params.require(:done_letting_go_item).permit(:image, :category_id, :name, :reason_id, :letting_go_way_id)
  end
end
