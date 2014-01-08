#!ruby
# encoding: UTF-8
require './config/environment'
require 'set'
DEBUG = false

if DEBUG
  models = [Question, Choice, CorrectAnswer]
  models.each do |t|
    puts t
    cs = t.method(:column_names)[]
    cs.each do |c|
      unless c == "created_at" || c == "updated_at"
	print "#{c} "
      end
    end
    puts
  end
end

q = Question.first

print q.description
q.choices.each do |c|
  puts c.choice_number
  print c.description
  puts
end

answers = []
cardinality = q.choices.size
loop do
  print "1 - #{cardinality}:"
  a = gets.to_i
  break unless (1 .. cardinality) === a
  answers << a
  answers.to_a
end

correct_nums = q.correct_answers.map(&:choice_number)

p 'correct_nums', correct_nums
answers = Set.new(answers)
puts "あなたは#{answers.to_a}を選んだ"
if answers == Set.new(correct_nums)
  print "\n正解\n\n"
else
  puts '間違い、正しくは:'
  print "#{correct_nums}\n\n"
end
print q.explanation
