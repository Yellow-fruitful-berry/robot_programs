function go_around(r, side)
    #turn = turn_side(side)
    counter_horisontal = 0
    counter_vertical = 0
    while(isborder(r, side))
        move!(r, Nord) # turn_side(side)
        counter_vertical = counter_vertical + 1
    end
    move!(r, side)
    while(isborder(r, Sud)) # invert_side(turn_side(side))
        move!(r, side)
        counter_horisontal = counter_horisontal + 1
    end
    #move!(r, invert_side(turn_side(side)))
    move!(r, Sud)
    c = counter_vertical
    while(c > 1)
        move!(r, Sud) # invert_side(turn_side(side))
        c = c - 1
    end
    # move!(r, Nord)
    area = counter_horisontal*counter_vertical
    global a = a - counter_horisontal - 1
    # print(area)
    return area
end
function turn_side(side)
    if side == Nord
        return West
    end
    if side == Sud
        return West
    end
    if side == Ost
        return Nord
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
    while(!((isborder(r, West)) & (isborder(r, Sud))))
        gotoborder(r, West)
        gotoborder(r, Sud)
    end
end
function gotoborder(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function main(r)
    gotobegin(r)
    count = 10
    cnt = 10
    # while(!(isborder(r, Ost) & isborder(r, Sud)))
    #     count = count + 1
    #     move!(r, Ost)
    # end
    max_area = 0
    # gotobegin(r)
    # while(!(isborder(r, West) & isborder(r, Nord)))
    #     cnt = cnt + 1
    #     move!(r, Nord)
    # end
    # print(count)
    # print(cnt)
    gotobegin(r)
    side = Ost
    while(cnt > 0)
        cnt = cnt - 1
        global a = count + 1
        while(a > 0)
            if(isborder(r, side))
                b = go_around(r, side)
                if(b > max_area)
                    max_area = b
                end
            else
                a = a - 1
                move!(r, side)
            end
        end
        move!(r, Nord)
        side = invert_side(side)
    end
    print("\n")
    print(max_area)
    #return max_area
end
