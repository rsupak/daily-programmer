
bitmap = [
    ['.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '#', '.', '.'],
    ['.', '.', '#', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '#', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.']
    ]


def displayBitmap():
    '''Display the bitmap on the screen.'''
    print() # blank line to visually set apart the image
    for row in bitmap:
        for character in row:
            print(character, end='') # print just the character, without a newline
        print() # newline at the end of the row
    print() # blank line to visually set apart the image

print('Here we display the bitmap:')
displayBitmap()

def setPixel(x, y, character):
    row = bitmap[y]    # pick a row from the bitmap
    row[x] = character # set character in the row


# How do we set the pixel in the top right corner to 'Q' ?
def setTopRightCornerToQ():
    indexOfTopRow = 0
    lengthOfTopRow = len(bitmap[indexOfTopRow])
    indexOfRightmostSquare = lengthOfTopRow - 1
    setPixel(indexOfRightmostSquare, indexOfTopRow, 'Q')

print('Set top right pixel to \'Q\' and display the bitmap again:')
setTopRightCornerToQ()
displayBitmap()

# Let's set the bottom left corner to 'R':
def setBottomLeftCornerToR():
    numberOfRows = len(bitmap)
    indexOfBottomRow = numberOfRows - 1
    indexOfLeftmostCharacter = 0
    setPixel(indexOfLeftmostCharacter, indexOfBottomRow, 'R')

print('Set bottom left pixel to \'R\' and display the bitmap again:')
setBottomLeftCornerToR()
displayBitmap()

print('Add some more # pixels.')
setPixel(3, 2, '#')
setPixel(6, 2, '#')
setPixel(7, 2, '#')
setPixel(8, 2, '#')
displayBitmap()

def getPixel(x, y):
    row = bitmap[y] # pick the row from the bitmap
    return row[x]   # get the character in the row


def startFloodFill(x, y, newCharacter):

    oldCharacter = getPixel(x, y)
    if (newCharacter != oldCharacter):
        floodFillRecursive(x, y, oldCharacter, newCharacter)

# ---------------------------------- #
# ---------------------------------- #

def floodFillRecursive(x, y, oldCharacter, newCharacter):
    '''
    Base cases:
        - if (x, y) is not a valid point, exit the function.
            - x and y cannot be negative (i.e. only zero and positive are valid)
            - y must be a valid row index (i.e. less than the number of rows)
            - x must be a valid column index (i.e. less than the number of columns in the row)
        - if the pixel at (x, y) is NOT oldCharacter, exit the function.
    Otherwise:
        - set the pixel at (x, y) to newCharacter
        Recursion:
            - call floodFillRecursive() for the pixel up from the current pixel
            - call floodFillRecursive() for the pixel down from the current pixel
            - call floodFillRecursive() for the pixel to the left of the current pixel
            - call floodFillRecursive() for the pixel to the right of the current pixel
    '''
    numberOfRows = len(bitmap[y])
    numberOfColumns  = len(bitmap)
    
    if x < 0 or y < 0 or x >= numberOfRows  or y >= numberOfColumns:
        return 
    if getPixel(x,y) != oldCharacter:
        return 

    setPixel(x, y ,newCharacter)
    floodFillRecursive(x-1,y,oldCharacter,newCharacter)
    floodFillRecursive(x+1,y,oldCharacter,newCharacter)
    floodFillRecursive(x,y-1,oldCharacter,newCharacter)
    floodFillRecursive(x,y+1,oldCharacter,newCharacter)

startFloodFill(3, 1, 'o')
displayBitmap()


#  bitmap = [
#     ['.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.'],
#     ['.', '.', '#', '.', '.'],
#     ['.', '.', '#', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.'],
#     ['.', '.', '#', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.'],
#     ['.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.'],
#     ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.']
# ]
