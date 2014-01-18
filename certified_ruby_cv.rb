#!ruby
# encoding: UTF-8
require './config/environment'
require 'set'
DEBUG = false
def keywait
  print '> '
  gets
end

q = Question.first

print q.description
keywait
q.choices.each do |c|
  puts c.choice_number
  print c.description
  puts
  keywait
end

answer = Set.new
cardinality = q.choices.size
loop do
  puts 'Enter a blank line to exit'
  print "1 - #{cardinality}:"
  a = gets.to_i
  break unless (1 .. cardinality) === a
  answer << a
  p answer
end

correct_ans = Set.new(q.correct_answers.map(&:choice_number))

puts "あなたは#{answer.to_a}を選んだ"
if answer == correct_ans
  puts "\n正解\n\n"
else
  puts '間違い、正しくは:'
  puts  "#{correct_ans.to_a}\n\n"
end
keywait

puts q.explanation

q.choices.each do |c|
  puts c.choice_number
  puts c.explanation
  puts
  puts c.description
  puts
  keywait
end
