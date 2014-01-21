module QuestionsHelper
  def num2alph(num, first_chr = ?a)
    base = first_chr.ord.pred
    (base + num).chr(__ENCODING__)
  end
  def format_choice(str, first_chr = ?a)
    str.gsub(/%([1-9])/){num2alph ($1).to_i, first_chr}
  end
end
