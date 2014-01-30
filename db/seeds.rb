# encoding: UTF-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all
Choice.delete_all
CorrectAnswer.delete_all
User.delete_all
###############################################################################
##				Question n				     #
###############################################################################
## Question
#question = Question.create(
#  description: <<EODSC,
#EODSC
#  explanation: <<EOEPN
#EOEPN
#)
#
## Choice
#Choice.create(
# question_id: question.id,
# choice_number: 1,
# description: <<EODSC,
#EODSC
# explanation: <<EOEPN
#EOEPN
#)
#
## CorrectAnswer
#CorrectAnswer.create(
#  question_id: question.id,
#  choice_number:
#)
#
###############################################################################

###############################################################################
##				Question 1				     #
###############################################################################
# Question
question = Question.create(
  description: <<EODSC,
以下に示すRubyプログラムのうち、実際に実行してもエラーにならないものを1つ選んでください。
EODSC
  explanation: <<EOEPN
正解は(c)です。
EOEPN
)

# Choice
Choice.create(
 question_id: question.id,
 choice_number: 1,
 description: <<EODSC,
def foo(x)
  puts x
end
foo()
EODSC
 explanation: <<EOEPN
(a)のコードは、fooメソッドの呼び出し時に引数を与えていません。

fooメソッドの定義には、仮引数xが指定されており、デフォルト値は設定されていません。
そのため、fooメソッドの呼び出しには必ず1つの引数を渡さねばならず、引数無しの呼び出しは「ArgumentError: wrong number of arguments (0 for 1)」のエラーとなります。
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 2,
 description: <<EODSC,
def bar
  puts n
end
n = 10
bar(n)
EODSC
 explanation: <<EOEPN
(b)のコードは(a)の逆で、仮引数を取らないメソッドbarに対して、引数を付けて呼び出しています。
そのため、このコードは「ArgumentError: wrong number of arguments (1 for 0)」のエラーとなります。
また、仮にbarメソッドの呼び出し時に引数を渡さなかったとしても、メソッド定義は新しいスコープを作るため、変数nが定義されていないbarメソッドでは、「NameError: undefined local variable or method `n’ for main:Object」のエラーが発生します。
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 3,
 description: <<EODSC,
n = 10
n.times do |i|
  puts i + n
end
EODSC
 explanation: <<EOEPN
(c)のコードは問題無く動作します。
timesメソッドに与えられたブロックは新しいスコープを作りますが、上位のスコープで定義された変数はそのまま同じ変数として参照できる仕様を持ちます。
そのため、ブロックローカル変数iと、上位スコープで定義されたnを足してもエラーにはなりません。
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 4,
 description: <<EODSC,
10.times do |i|
  n = i
  puts n
end
puts n
EODSC
 explanation: <<EOEPN
(d)のコードは動作しません。ブロック内で定義しているローカル変数nは、上位スコープで定義済みのものではなく、本ブロック内で初めて定義されたものです。
ブロック内で初めて定義された値は、ブロックのスコープに属し、他のスコープから参照することはできず、最後の「puts n」でエラーになります。
EOEPN
)

# CorrectAnswer
CorrectAnswer.create(
  question_id: question.id,
  choice_number: 3
)

##############################################################################


##############################################################################
#				Question 2				     #
##############################################################################
# Question
question = Question.create(
  description: <<EODSC,
以下の選択肢のうち、エラーにならずに正常に実行が完了するコードを1つ選択してください。
EODSC
  explanation: <<EOEPN
正解は(b)です。
EOEPN
)

# Choice
Choice.create(
 question_id: question.id,
 choice_number: 1,
 description: <<EODSC,
(a) 1..10.to_s
EODSC
 explanation: <<EOEPN
(a)のコードは、範囲オブジェクト「1..10」を文字列化しようとしたものですが、「ArgumentErrot: bad value for range」の例外が発生します。

範囲オブジェクトにメソッドを適用する場合は、カッコを用いて範囲オブジェクトのリテラルを明確にしなければなりません。
従ってこの場合は「(1..10).to_s」としないと目的の動作をしてくれないことになります。
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 2,
 description: <<EODSC,
(b) 10.*(0xFace)
EODSC
 explanation: <<EOEPN
整数オブジェクトにおける「*」メソッドは、レシーバの整数に引数の数値を掛け算した結果を返します。
この場合、「0xFace」は正当な16進数表記の整数オブジェクトを表しますので、問題無く掛け算は実行されます。
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 3,
 description: <<EODSC,
(c) 10.+(“10”)
EODSC
 explanation: <<EOEPN
(c)のコードは、整数オブジェクトに「+」メソッドを適用していますが、引数として文字列が与えられています。
整数オブジェクトの「+」メソッドは、引数に文字列を取ることができないため、このコードは例外が発生します。
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 4,
 description: <<EODSC,
(d) Time.now.strftime(1999, 12, 11)
EODSC
 explanation: <<EOEPN
(d)のコードは、Time#strftimeメソッドの引数に数値オブジェクトを3つ指定していますが、同メソッドの引数はフォーマット文字列を表す文字列オブジェクトのみを受け取るため、数値オブジェクトを引数に取ることはできず、例外が発生します。
EOEPN
)

# CorrectAnswer
CorrectAnswer.create(
  question_id: question.id,
  choice_number:2
)

##############################################################################
##############################################################################
#				Question 3				     #
##############################################################################
# Question
question = Question.create(
  description: <<EODSC,
  if文の条件で、真となるものを選んでください。
EODSC
  explanation: <<EOEPN
  falseとnilのみ偽になります。C言語族の方は0に注意。
EOEPN
)

# Choice
Choice.create(
 question_id: question.id,
 choice_number: 1,
 description: '1',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 2,
 description: '0',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 3,
 description: 'true',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 4,
 description: '""',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 5,
 description: 'nil',
 explanation: <<EOEPN
EOEPN
)

# CorrectAnswer
CorrectAnswer.create(
  question_id: question.id,
  choice_number: 1
)
CorrectAnswer.create(
  question_id: question.id,
  choice_number: 2
)
CorrectAnswer.create(
  question_id: question.id,
  choice_number: 3
)
CorrectAnswer.create(
  question_id: question.id,
  choice_number: 4
)

##############################################################################
##############################################################################
#				Question 4				     #
##############################################################################
# Question
question = Question.create(
  description: <<EODSC,
<pre>
file = open("test.txt")
begin
  line_no = 1
  while true
    line = file.[____]
    printf "%5d: %s", line_no, line
    line_no += 1
  end
rescue EOFError
end
file.close
</pre>
EODSC
  explanation: <<EOEPN
getsとreadlineは入力を一行読みます。終端に来るとgetsはnilを返しますが、readlineはEOFErrorを発します。
EOEPN
)

# Choice
Choice.create(
 question_id: question.id,
 choice_number: 1,
 description: 'gets',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 2,
 description: 'readline',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 3,
 description: 'readlines',
 explanation: <<EOEPN
EOEPN
)
Choice.create(
 question_id: question.id,
 choice_number: 4,
 description: 'read',
 explanation: <<EOEPN
EOEPN
)

# CorrectAnswer
CorrectAnswer.create(
  question_id: question.id,
  choice_number:2
)

##############################################################################

User.create(name: "a", password: 'a')
Question.all.each do |it|
  it.course='ruby'
  it.user_id = 'a'
  it.save
end
