% move_components
% moves agents in terms of componenets to avoid collisions with
% non-traversable areas

function move_components(agent_positions_x, agent_positions_y, direction_x, direction_y) %x,y being the components of vector to centroid
length_arr = [length(agent_positions_x) length(agent_positions_y)];
max_comp = max(length_arr);
min_comp = min(length_arr);
if(max_comp == length(agent_positions_x))
    dir_1 = agent_positions_x;
    dir_2 = agent_positions_y;
else
    dir_1 = agent_positions_y;
    dir_2 = agent_positions_x;
end

if (dir_1 >0)
if((dir_1 + 1) == 1) %1 has to refer to traversable matrix
    
    
    while((dir_1 +1) == 1)
        for i=1:1:max_comp
        dir_1;
        end
    end
    if((dir_1 + 1) == 0)
        if((dir_2 +1)== 1)
            while((dir_2 +1) == 1)
                forj=1:1:min_comp
                 ;
                end
            end
        end
        
end


