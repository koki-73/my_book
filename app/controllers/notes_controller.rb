class NotesController < ApplicationController
  
  before_action :move_to_top, except: [:index, :show]

  def index
    @notes = Note.where(book_id: params[:book_id]).includes(:user)
    @book = Book.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    if Note.find_by(book_id: @book.id, user_id: current_user.id)
      flash[:error] = 'この本のノートは作成済みです'
      redirect_to book_notes_path(@book.id)
    else
      @note = Note.new
      @note.summaries.new
      @note.build_review
      @note.action_plans.new
      @note.build_memo
      @note.build_purpose
    end
  end

  def create
    @note = Note.new(note_params)
    @book = @note.book
    @summaries = @note.summaries
    @review = @note.review
    @action_plans = @note.action_plans
    @memo = @note.memo
    @purpose = @note.purpose
    if note_params[:summaries_attributes].present? || note_params[:review_attributes].present? || note_params[:action_plans_attributes].present? || note_params[:purpose_attributes].present? || note_params[:memo_attributes].present?
      if @note.save
        redirect_to book_notes_path(@note.book_id)
      else
        render "new"
      end
    else
      render "new"
    end
  end
  
  def edit
    @book = Book.find(params[:book_id])
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @book = Book.find(params[:book_id])
    if @note.update(note_params)
      redirect_to book_notes_path(@note.book_id)
    else
      render "edit"
    end
  end
  
  def show
    @book = Book.find(params[:book_id])
    @note = Note.find(params[:id])
    @summaries = @note.summaries
    @review = @note.review
    @action_plans = @note.action_plans
    @purpose = @note.purpose
    @memo = @note.memo
    @comment = Comment.new
    @comments = Comment.where(note_id: params[:id]).includes(:user)
    @likes = Like.where(note_id: params[:id])
    if current_user&.already_liked?(@note)
      @like = Like.find_by(note_id: @note.id, user_id: current_user.id)
    else
      @like = Like.new
    end
  end

  def destroy
    note = Note.find(params[:id])
    if user_signed_in? && note.user_id == current_user.id && note.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  private
  def note_params
    params.require(:note).permit(summaries_attributes: [:title, :content, :summary_number, :_destroy, :id],
                                 review_attributes: [:content, :_destroy, :id],
                                 action_plans_attributes: [:content, :user_id, :_destroy, :id],
                                 memo_attributes: [:content, :_destroy, :id],
                                 purpose_attributes: [:content, :_destroy, :id])
                                 .merge(user_id: current_user.id)
                                 .merge(params.permit(:book_id))
  end

  def move_to_top
    redirect_to root_path unless user_signed_in?
  end

end
