#!ruby
# encoding: UTF-8
require './config/environment'

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

q = Question.first
print q.description
q.choices.each do |c|
  puts c.choice_number
  print c.description
  puts
end

puts '正解は...'
print "\n" * 25
q.correct_answers.each {|ca| print"#{ca.choice_number} "}
puts
print q.explanation
