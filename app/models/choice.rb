class Choice < ActiveRecord::Base
  attr_accessible :choice_number, :description, :question_id, :explanation
  belongs_to :question

  validates :question, presence: {message: 'does not exist'}
  validates :choice_number, :description, presence: true
  validates :choice_number, numericality: {only_integer: true, greater_than: 0}
  validates :choice_number, uniqueness: {scope: :question_id}
  validates_each :choice_number do |record, attr, value|
    choice_ns = record.question.choices.select(:choice_number)
    if choice_ns.maximum(:choice_number) == choice_ns.count # 抜けがないなら
      unless choice_ns.count.succ == value
	record.errors.add(attr, "must be #{choice_ns.count.succ}")
      end
    else
# val がギャップに含まれる?
<<SQL
SELECT (N.num + 1) AS gap_start,
       (MIN(M.num) - 1) AS gap_end
  FROM Numbers N INNER JOIN Numbers M
    ON M.num > N.num
 GROUP BY N.num
HAVING (N.num + 1) < MIN(M.num);

SQL
    end
  end
end
