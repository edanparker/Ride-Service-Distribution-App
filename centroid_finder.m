function Centroids = centroid_finder(Agent_Points, Mass, Density, Number_of_Robots, Agent_Positions, Partition_Number)
% Centroids is a nx2 matrix, where (i,1) and (i,2) represent the ith
% agent's centroid's x and y value, respectively.

% Calculates Sum(x*D(x,y)), then divides by mass to get x centroid, does 
% the same to get y centroid. This follows the accepted equation for
% centroid of an area. 

Centroids = zeros(Number_of_Robots, 2);
Centroid_sum = zeros(Number_of_Robots, 2);
Traversable_Matrix = xlsread('Traversable_Matrix.xlsx'); %read in traversable matrix
 
for i = 1:Number_of_Robots 
    for j = 1:size(Agent_Points{1,i},1)
        x_density = floor(Agent_Points{1,i}(j,1)*(Partition_Number));
        y_density = floor(Agent_Points{1,i}(j,2)*(Partition_Number));
        x = Agent_Points{1,i}(j,1);
        y = Agent_Points{1,i}(j,2);
        if x_density > 0 && y_density > 0
            Centroid_sum(i,1) = Centroid_sum(i,1) + x*Density(x_density,y_density);
            Centroid_sum(i,2) = Centroid_sum(i,2) + y*Density(x_density,y_density);
        end
    end
end

for i = 1:Number_of_Robots
    if Mass(i) == 0 % If robot has no surrounding mass then don't move it.
        Centroids(i,1) = Agent_Positions(i,1);
        Centroids(i,2) = Agent_Positions(i,2);
    else % Otherwise, calculate the centroid.
        Centroids(i,1) = Centroid_sum(i,1)/Mass(i);
        Centroids(i,2) = Centroid_sum(i,2)/Mass(i);
    end
end
for i = 1:Number_of_Robots % iterate through each centroid
    if Traversable_Matrix(Centroids(i,1),Centroids(i,2)) == 0 % returns true if the ith centroid currently lies in an untraversable point
        for j = 1:4 
            % initializes possible centroid points
            possible_centroid_north = [Centroids(i,1) Centroids(i,2)];
            possible_centroid_east = [Centroids(i,1) Centroids(i,2)];
            possible_centroid_south = [Centroids(i,1) Centroids(i,2)];
            possible_centroid_west = [Centroids(i,1) Centroids(i,2)];
            % bumps the possible centroid points in their respective
            % directions until they are positioned in a traversable portion
            % of the map
            while(Traversable_Matrix(possible_centroid_north(1),possible_centroid_north(2)) == 0)
                possible_centroid_north(2) = possible_centroid_north(2) + 1;
            end
            while(Traversable_Matrix(possible_centroid_east(1),possible_centroid_east(2)) == 0)
                possible_centroid_east(1) = possible_centroid_east(1) + 1;
            end
            while(Traversable_Matrix(possible_centroid_south(1),possible_centroid_south(2)) == 0)
                possible_centroid_south(2) = possible_centroid_south(2) - 1;
            end
            while(Traversable_Matrix(possible_centroid_west(1),possible_centroid_west(2)) == 0)
                possible_centroid_west(1) = possible_centroid_west(1) - 1;
            end
            % gets the magnitude of each vector
            north_magnitude = sqrt((possible_centroid_north(1)-Centroids(i,1))^2+(possible_centroid_north(2)-Centroids(i,2))^2);
            east_magnitude = sqrt((possible_centroid_east(1)-Centroids(i,1))^2+(possible_centroid_east(2)-Centroids(i,2))^2);
            south_magnitude = sqrt((possible_centroid_south(1)-Centroids(i,1))^2+(possible_centroid_south(2)-Centroids(i,2))^2);
            west_magnitude = sqrt((possible_centroid_west(1)-Centroids(i,1))^2+(possible_centroid_west(2)-Centroids(i,2))^2);
            % this block finds finds the possible centroid placement with
            % the least distance to original centroid position
            if north_magnitude < south_magnitude
                if east_magnitude < west_magnitude
                    if north_magnitude < east_magnitude
                        % sets centroid to the north potential point
                        Centroids(i,1) = possible_centroid_north(1);
                        Centroids(i,2) = possible_centroid_north(2);
                    else
                        % sets centroid to the east potential point
                        Centroids(i,1) = possible_centroid_east(1);
                        Centroids(i,2) = possible_centroid_east(2);
                    end
                else
                    if north_magnitude < west_magnitude
                        % sets centroid to the north potential point
                        Centroids(i,1) = possible_centroid_north(1);
                        Centroids(i,2) = possible_centroid_north(2);
                    else
                        % sets centroid to the west potential point
                        Centroids(i,1) = possible_centroid_west(1);
                        Centroids(i,2) = possible_centroid_west(2);
                    end
                end
            end
            if south_magnitude < north_magnitude
                if east_magnitude < west_magnitude
                    if south_magnitude < east_magnitude
                        % sets centroid to the south potential point
                        Centroids(i,1) = possible_centroid_south(1);
                        Centroids(i,2) = possible_centroid_south(2);
                    else
                        % sets centroid to the east potential point
                        Centroids(i,1) = possible_centroid_east(1);
                        Centroids(i,2) = possible_centroid_east(2);
                    end
                else
                    if south_magnitude < west_magnitude
                        % sets centroid to the south potential point
                        Centroids(i,1) = possible_centroid_south(1);
                        Centroids(i,2) = possible_centroid_south(2);
                    else
                        % sets centroid to the west potential point
                        Centroids(i,1) = possible_centroid_west(1);
                        Centroids(i,2) = possible_centroid_west(2);
                    end
                end
            end
        end
    end
end