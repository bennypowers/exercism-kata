from compose import compose

reversed_str = compose(reversed, list)

def reverse(text):
    return "".join(reversed_str(text)) if text else text
