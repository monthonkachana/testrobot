def create_pyramid(height, width):
    pyramid = ""
    for i in range(1, height + 1):
        spaces = ' ' * (height - i) 
        stars = '*' * (2 * i - 1) 
        centered_line = spaces + stars
        centered_line = centered_line.center(width)
        pyramid += centered_line + '\n'
    return pyramid


print(create_pyramid(5,0))
