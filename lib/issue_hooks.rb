# -*- coding: utf-8 -*-
module SetRankFromEstimatedHoursInIssues
  NAME = "ランク" # TODO use settings

  def self.included(c)
    c.before_save :set_rank_from_estimated_hours
  end

  def set_rank_from_estimated_hours
    cv = self.custom_field_values.find{|cfv| cfv.custom_field.name == NAME }
    return unless cv
    cf = cv.custom_field
    # description example:
    # "S 80h+\r\nA 40h+\r\nB 20h+\r\nC 8h+\r\nD 3h+\r\nE 1h+\r\n"
    cv.value = nil
    estimated_hours = self.estimated_hours.to_i
    cf.description.split.each_slice(2) do |v, s|
      if s.to_i <= estimated_hours
        cv.value = v
        break
      end
    end
  end
end
Issue.include SetRankFromEstimatedHoursInIssues
