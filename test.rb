#!ruby
# encoding: UTF-8
require './config/environment'
require 'set'
DEBUG = false

if DEBUG
  tables = [Question, Choice, CorrectAnswer]
  tables.each do |t|
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

as = []
loop do
  cardinality = q.choices.size
  print "1 - #{cardinality}:"
  a = gets.to_i
  break unless (1 .. cardinality) === a
  as << a
end

correct_nums = q.correct_answers.map(&:choice_number)
p as, correct_nums if DEBUG

as = Set.new(as)
puts "あなたは#{as.to_a}を選んだ"
if as == Set.new(correct_nums)
  print "\n正解\n\n"
else
  puts '間違い、正しくは:'
  p correct_nums
  puts
end
print q.explanation
