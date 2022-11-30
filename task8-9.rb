# frozen_string_literal: true

require 'active_record'

class Student < ActiveRecord::Base
  belongs_to :parent
end

class Parent < ActiveRecord::Base
  has_many :students
end

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'evan',
  password: ARGV[0],
  database: 'evan'
)

# впадлу делать миграции
ActiveRecord::Base.connection.execute(
  'CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    parent_id INT
  );'
)

ActiveRecord::Base.connection.execute(
  'CREATE TABLE IF NOT EXISTS parents (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL
  );'
)

# seed tables
if Parent.count.zero?
  Parent.create id: 1, name: 'Elena'
  Parent.create id: 2, name: 'Oleg'
  Parent.create id: 3, name: 'Marina'
end

if Student.count.zero?
  Student.create id: 1, name: 'Ivan', parent_id: Parent.find_by(name: 'Marina').id
  Student.create id: 2, name: 'Semen', parent_id: Parent.find_by(name: 'Oleg').id
  Student.create id: 3, name: 'Vladimir', parent_id: Parent.find_by(name: 'Elena').id
  Student.create id: 4, name: 'Vitaliy', created_at: '2019-10-10 10:00:00'
  Student.create id: 5, name: 'Arseniy', created_at: '2019-10-11 10:00:00'
  Student.create id: 6, name: 'Ivan'
end

# answers

# посчитайте количество всех студентов
# SELECT count(*) FROM students;
puts Student.count

# посчитайте количество студентов с именем Иван
# SELECT count(*) FROM students WHERE name = 'Ivan';
puts Student.where(name: 'Ivan').count

# посчитайте количество студентов созданных после 1 сентября 2020 года
# SELECT count(*) FROM students WHERE created_at > '2020-09-01';
puts Student.where("created_at > '2020-09-01'").count

# посчитайте количество студентов с родителями
# SELECT count(*) FROM students WHERE parent_id IS NOT NULL;
puts Student.where('parent_id IS NOT NULL').count

# посчитайте количество студентов с родителями при том что имя родителя Марина
# SELECT count(*) FROM students WHERE parent_id = (SELECT id FROM parents WHERE name = 'Marina');
puts Parent.find_by(name: 'Marina').students.count

# посчитайте количество студентов без родителя
# SELECT count(*) FROM students WHERE parent_id IS NULL;
puts Student.where(parent_id: nil).count

