function check_boundary!(r::Robot, side)
    while !isborder(r, side)
        move!(r, side)
    end
end
function mark_side!(r::Robot, side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
    end
end
function mark_boundaries!(r::Robot)
    check_boundary!(r, Sud)
    check_boundary!(r, West)
    mark_side!(r, Nord)
    mark_side!(r, Ost)
    mark_side!(r, Sud)
    mark_side!(r, West)
end
