function gotobegin(r)
    # функция, доставляющая робота в Юго-Западный угол
    # возвращает количество пройденных шагов по горизонтали и вертикали
    a = 0
    b = 0
    while(!((isborder(r, West)) & (isborder(r, Sud))))
        a = a + gotoborder(r, West)
        b = b + gotoborder(r, Sud)
    end
    return(a, b)
end
function gotoborder!(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function push_hor(r, side, counter)
    # функция, передвигающая робота в заданном направлении на определённое количество шагов,
    # не взирая на перегородки
    b = 0
    while(counter>0)
        if(isborder(r, side))
            count,b = go_around(r, side)
            counter = counter - count - 1
        else
            move!(r, side)
            counter = counter - 1
        end
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
function goto_coord(r, side, coord)
    # функция, двигающая робота на данное количество шагов в данную сторону
    # уязвима для перегородок
    while(coord > 0)
        coord = coord - 1
        move!(r, side)
    end
end   
function main(r)
    x,y = gotobegin(r)
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
    gotobegin(r)
    goto_coord(r, Nord, y)
    push_hor(r, Ost, x)
end
