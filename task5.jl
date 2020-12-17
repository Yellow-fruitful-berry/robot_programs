global fl_incorner = false
function go_around(r, side)
    counter = 0
    turn = turn_side(r, side)
    while(isborder(r, side))
        if((isborder(r, West)) & (isborder(r, Sud)))
            global fl_incorner = true
            break
        else
            # move!(r, turn_side(r, side))
            # counter = counter + 1
            gotoborder(r, Sud)
        end
    end
    
    # if(!fl_incorner)
        # move!(r, side)
        # while((isborder(r, side_invert(r, turn))))
        #     move!(r, side)
        # end
        # while((counter > 0))
        #     counter = counter - 1
        #     move!(r, side_invert(r, turn_side(r, side)))
        # end
    # end
end
function turn_side(r, side)
    if(side == Nord)
        return Ost
    end
    if(side == Sud)
        return West
    end
    if(side == West)
        return Sud
    end
    if(side == Ost)
        return Sud
    end
end
function side_invert(r, side)
    if(side == Nord)
        return Sud
    end
    if(side == Sud)
        return Nord
    end
    if(side == West)
        return Ost
    end
    if(side == Ost)
        return West
    end
end
function gotobegin(r)
    while(!fl_incorner)
        if( fl_incorner)
            break
        else 
            gotoborder(r, West)
            go_around(r, West)
            if( fl_incorner)
                break
            end
        end
    end
end
function gotoborder(r, side)
    while(!isborder(r, side))
        move!(r, side)
    end
end
function mark_corners(r)
    putmarker!(r)
    gotoborder(r, Nord)
    putmarker!(r)
    gotoborder(r, Ost)
    putmarker!(r)
    gotoborder(r, Sud)
    putmarker!(r)
    gotoborder(r, West)
end
function main1(r)
    gotobegin(r)
    mark_corners(r)
end