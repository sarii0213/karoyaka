class DoneLettingGoItemsController < ApplicationController
  def index
    @done_letting_go_items = current_user.done_letting_go_items
  end

  def show
    @done_letting_go_item = current_user.done_letting_go_items.find(params[:id])
  end

  def new
    if params[:item_id]
      @to_let_go_item = ToLetGoItem.find(params[:item_id])
    end
    @done_letting_go_item = DoneLettingGoItem.new
  end

  def edit
    @done_letting_go_item = current_user.done_letting_go_items.find(params[:id])
  end

  def create
    @done_letting_go_item = current_user.done_letting_go_items.build(done_letting_go_item_params)
    if params[:done_letting_go_item][:item_id] && done_letting_go_item_params[:image].blank?
      carried_item = ToLetGoItem.find(params[:done_letting_go_item][:item_id])
      if carried_item.image.attached?
        carried_item.image.blob.open do |tmp|
          @done_letting_go_item.image.attach(io: File.open(tmp.path), filename: carried_item.image.blob.filename)
        end
      end
    end
    if @done_letting_go_item.save
      carried_item.destroy!
      redirect_to done_letting_go_item_path(@done_letting_go_item), notice: '手放し済みリストに登録しました'
    elsif params[:done_letting_go_item][:item_id]
      redirect_to new_done_letting_go_item_path(item_id: params[:done_letting_go_item][:item_id]), flash: { error: @done_letting_go_item.errors.full_messages }
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
