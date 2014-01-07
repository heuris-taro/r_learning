# encoding: UTF-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Question
Question.delete_all
question1 = Question.create(
  description: <<EODSC,
以下に示すRubyプログラムのうち、実際に実行してもエラーにならないものを1つ選んでください。
EODSC
  explanation: <<EOEPN
(a)のコードは、fooメソッドの呼び出し時に引数を与えていません。

fooメソッドの定義には、仮引数xが指定されており、デフォルト値は設定されていません。
そのため、fooメソッドの呼び出しには必ず1つの引数を渡さねばならず、引数無しの呼び出しは「ArgumentError: wrong number of arguments (0 for 1)」のエラーとなります。

(b)のコードは(a)の逆で、仮引数を取らないメソッドbarに対して、引数を付けて呼び出しています。
そのため、このコードは「ArgumentError: wrong number of arguments (1 for 0)」のエラーとなります。
また、仮にbarメソッドの呼び出し時に引数を渡さなかったとしても、メソッド定義は新しいスコープを作るため、変数nが定義されていないbarメソッドでは、「NameError: undefined local variable or method `n’ for main:Object」のエラーが発生します。

(c)のコードは問題無く動作します。
timesメソッドに与えられたブロックは新しいスコープを作りますが、上位のスコープで定義された変数はそのまま同じ変数として参照できる仕様を持ちます。
そのため、ブロックローカル変数iと、上位スコープで定義されたnを足してもエラーにはなりません。

(d)のコードは動作しません。ブロック内で定義しているローカル変数nは、上位スコープで定義済みのものではなく、本ブロック内で初めて定義されたものです。
ブロック内で初めて定義された値は、ブロックのスコープに属し、他のスコープから参照することはできず、最後の「puts n」でエラーになります。
EOEPN
)

# Choice
Choice.delete_all
Choice.create(
 question_id: question1.id,
 choice_number: 1,
 description: <<EODSC
def foo(x)
  puts x
end
foo()
EODSC
)
Choice.create(
 question_id: question1.id,
 choice_number: 2,
 description: <<EODSC
def bar
  puts n
end
n = 10
bar(n)
EODSC
)
Choice.create(
 question_id: question1.id,
 choice_number: 3,
 description: <<EODSC
n = 10
n.times do |i|
  puts i + n
end
EODSC
)
Choice.create(
 question_id: question1.id,
 choice_number: 4,
 description: <<EODSC
10.times do |i|
  n = i
  puts n
end
puts n
EODSC
)

# CorrectAnswer
CorrectAnswer.delete_all
CorrectAnswer.create(
  question_id: question1.id,
  choice_number: 3
)














