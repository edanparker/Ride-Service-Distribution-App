%% MOVE COMPONENTS

function move_components(agent_position_x,agent_position_y,direction_x,direction_y) %% Pathfinding Function that uses the agents current position and the direction vector to the centroid
length_arr = [length(delta_x) length(delta_y)]; %% Establishes the distance array
max_dist = max(length_arr); %% Finds the max distance between the x distance and y distance
if(max_dist == length(delta_x)) %% Assigns names depending on the max distance component
    pos_1 = agent_position_x;
    pos_2 = agent_position_y;
else
    pos_1 = agent_postion_y;
    pos_2 = agent_position_x;
end

if direction_x > 0 && direction_y > 0
%% CASE 1 direction = (+,+) -- Moves the agent one position if both x and y directions are positive
if pos_1 + 1 == 1 %% If the agent can move one position in the direction with the greateast distance, move it.
    move_agents(pos_1 + 1);
else 
    move_agents(pos_2 + 1); %% If it can't, move it in the direction with the smaller distance.
end 


elseif direction_x < 0 && direction_y < 0
%% CASE 2 direction = (-,-) -- Moves the agent 1 position if both x and y directions are negative
if pos_1 - 1 == 1 
    move_agents(pos_1 - 1);
else
    move_agents(pos_2 - 1);
end 


elseif direction_x > 0 && direction_y < 0
%% CASE 3 direction = (+,-) -- Moves the agent 1 position if the x direction is postive and y direction is negative
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


elseif direction_x < 0 && direction_y > 0
%% CASE 4 direction = (-,+) -- Moves the agent 1 position if the x direction is negative and y direction is positive
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
end

