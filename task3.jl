function mark_all!(r::Robot)
    marktoborder!(r, Nord)
    if(!isborder(r, Ost))
        move!(r, Ost)
        marktoborder!(r, Sud)
        if(!isborder(r, Ost))
            move!(r, Ost)
            mark_all!(r)
        end
    end
end
function gotobegin!(r)
    gotoborder!(r, West)
    gotoborder!(r, Sud)
end
function gotoborder!(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function marktoborder!(r, side)
    while(!isborder(r, side))
        putmarker!(r)
        move!(r, side)
    end
    putmarker!(r)
end
function main(r::Robot)
    gotobegin!(r)
    mark_all!(r)
    gotobegin!(r)
end