Redmine::Plugin.register :set_rank_from_estimated_hours_in_issues do
  name 'Set Rank From Estimated Hours In Issues plugin'
  author 'Kazuhiro NISHIYAMA'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/znz/set_rank_from_estimated_hours_in_issues'
  author_url 'https://github.com/znz'
end

require_relative 'lib/issue_hooks'
