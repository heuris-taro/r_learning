module QuestionsHelper
  def num2alph(num, first_chr = ?a)
    base = first_chr.ord.pred
    (base + num).chr(__ENCODING__)
  end
end
