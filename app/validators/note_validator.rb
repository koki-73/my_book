class NoteValidator < ActiveModel::Validator
  def validate(record)
    items = [record.purpose, record.summaries, record.review, record.memo, record.action_plans]
    return unless items.present?
    record.errors[:base] << 'タイトル・名前・カテゴリのどれか1つは入力してください。'
  end
end