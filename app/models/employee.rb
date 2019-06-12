class MyValidation < ActiveModel::Validator
    def validate(record)
        aliases = Employee.all.collect do |emp|
            emp.alias
        end
        titles = Employee.all.collect do |emp|
            emp.title
        end
        if aliases.include?(record[:alias]) || titles.include?(record[:title])
            record.errors[:name] << "Dwights Rule"
        end
    end
end

class Employee < ApplicationRecord
    belongs_to :dog
    validates_with MyValidation
end
