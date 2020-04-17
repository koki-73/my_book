class NotesController < ApplicationController
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
      @summaries = [Summary.new, Summary.new, Summary.new]
    end
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      @summaries = summaries_params
      @summaries.each do |summary|
        summary[:note_id] = @note.id
        Summary.create(summary)
      end
      @review = Review.create(review_params)
      @action_plan = ActionPlan.create(action_plan_params)
      redirect_to book_note_path(@note.book_id, @note.id)
    else 
      flash[:error] = 'この本のノートは作成済みです'
      redirect_to book_notes_path(@note.book_id)
    end
  end
  
  def edit
    @book = Book.find(params[:book_id])
    @note = Note.find(params[:id])
    @summaries = Summary.where(note_id: @note.id)
    while @summaries[2].nil? do
      @summaries = @summaries + [Summary.new]
    end
    if Review.find_by(note_id: @note.id)
      @review = Review.find_by(note_id: @note.id).content
    else
      @review = Review.new.content
    end
    if ActionPlan.find_by(note_id: @note.id)
      @action_plan = ActionPlan.find_by(note_id: @note.id).content
    else
      @action_plan = ActionPlan.new.content
    end
  end
  
  def update
    @note = Note.find_by(note_params)
    @note.update(note_params)
    @summaries = summaries_params
    if @summaries.class == ActionController::Parameters
      @summaries.keys.each do |id|
        old_summary = Summary.find(id)
        old_summary.update(@summaries["#{id}"])
      end
    else
      @summaries.each do |summary|
        summary[:note_id] = @note.id
        Summary.create(summary)
      end
    end
    if Review.find_by(note_id: @note.id)
      @review = Review.find_by(note_id: @note.id)
    else
      @review = Review.new
    end
    @review.update(review_params)
    if ActionPlan.find_by(note_id: @note.id)
      @action_plan = ActionPlan.find_by(note_id: @note.id)
    else
      @action_plan = ActionPlan.new
    end
    @action_plan.update(action_plan_params)
    redirect_to book_note_path(@note.book_id, @note.id)
  end
  
  def show
    @book = Book.find(params[:book_id])
    @note = Note.find(params[:id])
    @summaries = @note.summaries
    @reviews = @note.reviews
    @action_plans = @note.action_plans
    @comment = Comment.new
    @commnets = Comment.where(note_id: params[:id]).includes(:user)
    @like = Like.new
    @likes = Like.where(note_id: params[:id])
  end

  private
  def note_params
    params.permit(:book_id).merge(user_id: current_user.id)
  end
  
  def summaries_params
    params.require(:note).permit(summaries: [:note_id, :title, :content, :summary_number])[:summaries]
  end
  
  def review_params
    params.require(:note).require(:review).permit(:content).merge(note_id: @note.id)
  end

  def action_plan_params
    params.require(:note).require(:action_plan).permit(:content).merge(note_id: @note.id, user_id: current_user.id)
  end

end
