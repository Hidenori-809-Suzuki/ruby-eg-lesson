class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    # binding.pry
  end

  def create
    board = Board.create(board_params)
    redirect_to board
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)

    redirect_to @board
  end

  def destroy
    @board.destroy

    redirect_to boards_path
  end


  private

  def board_params
    params.require(:board).permit(:author_name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end
