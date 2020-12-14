function gotobegin!(r)
    gotoborder!(r, West)
    gotoborder!(r, Sud)
end
function gotoborder!(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function mark_side_chess(r, a, side)
    while(!isborder(r, side))
        if(!(a))
            a = true
            putmarker!(r)
        else
            a = false
        end
        move!(r, side)
    end
end
function main(r)
    gotobegin!(r)
    a = false
    direction = Ost
    while(!isborder(r, Nord))
        mark_side_chess(r, a, Ost)
        move!(r, Nord)
        if(!isborder(r, Nord))
            mark_side_chess(r, a, West)
            move!(r, Nord)
        else
            direction = West
        end
    end
    mark_side_chess(r, a, direction)
    gotobegin!(r)
end