class RenameTableSchoolgradesToSchoolGrades < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :schoolgrades, :school_grades
  end

  def self.down
    rename_table :school_grades, :schoolgrades
  end
end
