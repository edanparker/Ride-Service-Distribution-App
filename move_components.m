% move_components
% moves agents in terms of componenets to avoid collisions with
% non-traversable areas

function move_components(agent_positions_x,agentposition_y,direction_x,dirction_y) %x,y being the components of agent_positions
length_arr = [length(x) length(y)];
max_dist = max(length_arr);
if(max_dist == length(x))
    dir_1 = direction_x;
    pos_1 = agent_position_x;
    dir_2 = direction_y;
    pos_2 = agent_position_y
else
    dir_1 = agent_postion_y;
    dir_2 = agent_position_x;
end

%% CASE 1 direction = (+,+)
if pos_1 + 1 == 1 
    move_agents(pos_1 + 1);
else 
    move_agents(pos_2 + 1);
end 
 
%% CASE 2 direction = (-,-)
if pos_1 - 1 == 1
    move_agents(pos_1 - 1);
else
    move_agents(pos_2 - 1);
end 

%% CASE 3 direction = (+,-)
if pos_1 == agent_position_x
    if pos_1 + 1 == 1
        move_agents(pos_1 + 1);
    else 
        move_agents(pos_2 - 1)
    end
elseif pos_1 == agent_position_y
    if pos_1 - 1 == 1 
        move_agents(pos_1 - 1)
    else
        move_agents(pos_2 + 1)
    end 
end 

%% CASE 4 direction = (-,+)
if pos_1 == agent_position_x
    if pos_1 - 1 == 1
        move_agents(pos_1 - 1);
    else 
        move_agents(pos_2 + 1)
    end
elseif pos_1 == agent_position_y
    if pos_1 + 1 == 1 
        move_agents(pos_1 + 1)
    else
        move_agents(pos_2 - 1)
    end 
end 


