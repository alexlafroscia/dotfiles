def match(command):
    return 'brewfile already exists' in command.output.lower()

def get_new_command(command):
    return '{} --force'.format(command.script)
