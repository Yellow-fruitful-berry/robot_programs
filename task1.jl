function check_cross!(r::Robot)
    nord = 0
    sud = 0
    west = 0
    ost = 0
    while !isborder(r, Nord)
        move!(r, Nord)
        nord = nord + 1
    end
    while !isborder(r, Sud)
        putmarker!(r)
        move!(r, Sud)
        sud = sud + 1
    end
    sud = sud - nord
    putmarker!(r)
    while sud >0
        sud = sud - 1
        move!(r, Nord)
    end


    while !isborder(r, West)
        move!(r, West)
        west = west + 1
    end
    while !isborder(r, Ost)
        putmarker!(r)
        move!(r, Ost)
        ost = ost + 1
    end
    ost = ost - west
    putmarker!(r)
    while ost >0
        ost = ost - 1
        move!(r, West)
    end
end
