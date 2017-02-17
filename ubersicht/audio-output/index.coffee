# this is the shell command that gets executed every time this widget refreshes
command: "/Users/alexlafroscia/.homebrew/bin/SwitchAudioSource -c"

# the refresh frequency in milliseconds
refreshFrequency: "1s"

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> ""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
  background: rgba(235,235,235,0.8)
  border-radius: 8px
  color: #222
  font-family: -apple-system
  font-size: 15px
  font-weight: 200
  left: 0
  margin: 1em
  padding: 0.8em
  top: 0

  :before
    background: inherit
    bottom: 0
    content: ''
    filter: blur(10px) saturate(2)
    left: 0
    position: absolute
    right: 0
    top: 0

  .bold
    font-weight: bold
"""

update: (output, domEl) ->
  audioOutputProgram = output

  domEl.innerHTML = """
    <section>
      <div class="bold">
        Audio Out:
      </div>
      #{audioOutputProgram}
    </section>
  """
