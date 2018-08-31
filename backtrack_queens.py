# function backtrack(junction):  
#   if is_exit:
#     return true
#   for each direction of junction:
#     if backtrack(next_junction):
#       return true    
#   return false

# Results in
# - at junction 1 chooses down       (possible values: [down, up])
#     - at junction 3 chooses right  (possible values: [right, up])
#          no junctions/exit         (return false)
#     - at junction 3 chooses up     (possible values: [right, up])
#          no junctions/exit         (return false)
# - at junction 1 chooses up         (possible values: [down, up])
#     - at junction 2 chooses down   (possible values: [down, left]) 
#          the exit was found!       (return true)


# Starting Values: (x, y)
# - first hop, (x+1, y+2)   | possible values [(x+1,y+2),(x+1,y-2),(x-1,y+2),(x-1,y-2),
                                                # (x+2,y+1),(x+2,y-1),(x-2,y+1),(x-2,y-1)]
    # - 


grid_dict_x = {x:x for x in range(4)}
grid_dict_y = {y:None for y in range(4)}
# print(grid_dict_x)
# print(grid_dict_y)

def backtrack(queens, x_dict, y_dict):
    if queens == 0:
        temp_list = []
        for key, value in x_dict.items():
            temp_list.append((key,value))
        return temp_list
    else:
        grid_dict_x[0] = 0
        for key, value in x_dict.items():
            for y_key, y_val in y_dict.item():
                    

                


print(backtrack(0, grid_dict_x, grid_dict_y))