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
function mark_corners(r)
    for side in (Nord, Ost, Sud, West)
        putmarker!(r)
        gotoborder(r, side)
    end
end
function main1(r)
    gotobegin(r)
    mark_corners(r)
end