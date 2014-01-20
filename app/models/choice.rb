class Choice < ActiveRecord::Base
  attr_accessible :choice_number, :description, :question_id, :explanation
  belongs_to :question

  validates :question, presence: {message: 'does not exist'}
  validates :choice_number, :description, presence: true
  validates :choice_number, numericality: {only_integer: true, greater_than: 0}
  validates :choice_number, uniqueness: {scope: :question_id}
=begin
  validates_each :choice_number do |record, attr, value|
    choice_ns = record.question.choices.select(:choice_number)
    max_cns = choice_ns.maximum(:choice_number)
    if max_cns == choice_ns.count # 抜けがないなら
      unless choice_ns.count.succ == value
        record.errors.add(attr, "must be #{choice_ns.count.succ}")
      end
    else
      # val がギャップに含まれる?({number}: 密で小さい場合)
      differences = (1 .. max_cns).to_a - choice_ns.map(&:choice_number)
      unless differences.include?(value)
        record.errors.add(attr, "must be #{differences}")
      end
    end
  end
=end
end
