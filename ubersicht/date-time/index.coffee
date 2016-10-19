# this is the shell command that gets executed every time this widget refreshes
command: ""

# the refresh frequency in milliseconds
refreshFrequency: "1m"

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> ""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  color: white
  font-family: -apple-system
  left: 50%
  top: 50%
  transform: translate(-50%, -50%)
  font-weight: 200
  font-size: 60px
"""

update: (output, domEl) ->
  now = new Date()

  day = switch now.getDay()
    when 0 then 'Sunday'
    when 1 then 'Monday'
    when 2 then 'Tuesday'
    when 3 then 'Wednesday'
    when 4 then 'Thursday'
    when 5 then 'Friday'
    when 6 then 'Saturday'

  month = switch now.getMonth()
    when 0 then 'January'
    when 1 then 'February'
    when 2 then 'March'
    when 3 then 'April'
    when 4 then 'May'
    when 5 then 'June'
    when 6 then 'July'
    when 7 then 'August'
    when 8 then 'September'
    when 9 then 'October'
    when 10 then 'November'
    when 11 then 'December'

  date = now.getDate()
  suffix = switch
    when date is 1 then 'st'
    when date is 2 then 'nd'
    when date is 3 then 'rd'
    else 'th'

  domEl.innerHTML = "It is #{day}, #{month} #{date + suffix}"
