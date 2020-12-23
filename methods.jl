function go_around(r, side)
    # функция, позволяющая роботу обойти перегородку,
    # возвращает количество пройденных шагов по горизонтали и вертикали
    counter_horisontal = 0
    counter_vertical = 0
    while(isborder(r, side))
        move!(r, turn_side(side))
        counter_vertical = counter_vertical + 1
    end
    move!(r, side)
    while(isborder(r, invert_side(turn_side(side))))
        move!(r, side)
        counter_horisontal = counter_horisontal + 1
    end
    move!(r, invert_side(turn_side(side)))
    c = counter_vertical
    while(c > 1)
        move!(r, invert_side(turn_side(side)))
        c = c - 1
    end
    return (counter_horisontal, counter_vertical)
end
function turn_side(side)
    # функция, возвращающая сторону, пойдя куда можно обойти перегородку
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
    # функция, возвращаящая сторону обратную данной
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
function gotoborder(r, side)
    # функция, доставляющая робота до первой встретившейся ему перегородки,
    # возвращает количество пройденных шагов
    count = 0
    while(!isborder(r, side))
        move!(r, side)
        count = count + 1
    end
    return count
end
function measure_field(r)
    # функция, измеряющая размер поля, не учитывая начальную точку робота
    y = gotoborder(r, Nord)
    gotoborder(r, Sud)
    x = gotoborder(r, Ost)
    gotoborder(r, West)
    return (x,y)
end
function push_and_mark(r, side, counter)
    # функция, передвигающая робота в заданном направлении на определённое количество шагов,
    # не взирая на перегородки, ставит по пути маркеры
    b = 0
    while(counter>0)
        putmarker!(r)
        if(isborder(r, side))
            b,count = go_around(r, side)
            counter = counter - count - 1
        else
            move!(r, side)
            counter = counter - 1
        end
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
function goto_coord(r, side, coord)
    # функция, двигающая робота на данное количество шагов в данную сторону
    # уязвима для перегородок
    while(coord > 0)
        coord = coord - 1
        move!(r, side)
    end
end