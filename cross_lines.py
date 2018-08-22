def find_intersection(AB, CD):

    # changing the parameters to coordinates
    # because that's how I learned them!

    x1,y1,x2,y2 = AB[0][0],AB[0][1],AB[1][0],AB[1][1] # line AB x's and y's
    x3,y3,x4,y4 = CD[0][0],CD[0][1],CD[1][0],CD[1][1] # line CD x's and y's

    # check for parallel lines (if the slopes are equal, the lines are parallel)
    # extrapolated from mAB = (y1 - y2) / (x1 - x2) and mCD = (y3 - y4) / (x3 - x4)
    # if (y1 - y2) / (x1 - x2) = (y3 - y4) / (x3 - x4) or
    #  (y1 - y2) * (x3 - x4) = (y3 - y4) * (x1 - x2)

    if (y1 - y2) * (x3 - x4) == (y3 - y4) * (x1 - x2):
        return "Lines AB and CD are parallel, no intersection"
    else:

        # calculate the linear Bezier curve
        # I split the numerator and denominator calculations
        # because it was easier to read, and I kept making mistakes
        # typing it out into one long fraction


        bezier_numerator = (x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)
        bezier_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
        t = bezier_numerator / bezier_denominator 

        # (Px,Py) is the intersection of the two lines
        
        Px = (x1 + t*(x2 - x1))
        Py = (y1 + t*(y2 - y1))

        return Px, Py

AB = [(1,1),(4,4)]
CD = [(1,8),(2,4)]
z = find_intersection(AB,CD)
print(z)