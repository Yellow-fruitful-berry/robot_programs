function turn_side(side)
    if side == Nord
        return West
    end
    if side == Sud
        return West
    end
    if side == Ost
        return Sud
    end
    if side == West
        return Sud
    end
end
function invert_side(side)
    if side == Nord
        return Sud
    end
    if side == Sud
        return Nord
    end
    if side == Ost
        return West
    end
    if side == West
        return Ost
    end
end
function gotobegin(r)
    a = 0
    b = 0
    while(!((isborder(r, West)) & (isborder(r, Sud))))
        a = a + gotoborder(r, West)
        b = b + gotoborder(r, Sud)
    end
    return(a, b)
end
function gotoborder(r, side)
    count = 0
    while(!isborder(r, side))
        move!(r, side)
        count = count + 1
    end
    return count
end
function measure_field(r)
    y = gotoborder(r, Nord)
    gotoborder(r, Sud)
    x = gotoborder(r, Ost)
    gotoborder(r, West)
    return (x,y)
end
function measure_distance_to_border(r, side)
    distance = 0
    while(!isborder(r, side))
        move!(r, side)
        distance = distance + 1
    end
    d = distance
    while(d>0)
        move!(r, invert_side(side))
        d = d - 1
    end
    return distance
end
function draw_piece(r, side1, side2)
    x = measure_distance_to_border(r, side1)
    y = measure_distance_to_border(r, side2)
    print(x)
    print("\n")
    print(y)
    print("\n")
    print("\n")
    x1 = x
    y1 = y
    while((x>0) & (y>0))
        x = x - 1
        y = y - 1
        move!(r, side1)
        move!(r, side2)
        putmarker!(r)
        print("Шагов по горизонтали: ")
        print(x)
        print("\n")
        print("Шагов по вертикали: ")
        print(y)
        print("\n")
        print("\n")
    end
    while((x1>0) & (y1>0))
        x1 = x1 - 1
        y1 = y1 - 1
        move!(r, invert_side(side1))
        move!(r, invert_side(side2))
    end
end
function main(r)
    putmarker!(r)
    draw_piece(r, Nord, Ost)
    draw_piece(r, Nord, West)
    draw_piece(r, Sud, Ost)
    draw_piece(r, Sud, West)
end