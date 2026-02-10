import Base: convert

@enum Heading NORTH=1 EAST=2 SOUTH=3 WEST=4 

struct Point
    x::Int64
    y::Int64
end

convert(Point,xy::Tuple{Int64, Int64})=Point(xy[1],xy[2])

mutable struct Robot
    position::Point 
    heading::Heading
end

position(r::Robot) = r.position
heading(r::Robot) = r.heading

function turn_left!(robot::Robot)
    rotated = circshift(collect(instances(Heading)), 1)
    robot.heading = rotated[UInt(robot.heading)]
    robot
end

function turn_right!(robot::Robot)    
    rotated = circshift(collect(instances(Heading)), -1)
    robot.heading = rotated[UInt(robot.heading)]
    robot
end

function advance!(robot::Robot)
    dx, dy = 0,0
    robot.heading==NORTH && (dy += 1)
    robot.heading==SOUTH && (dy -= 1)
    robot.heading==EAST && (dx += 1)
    robot.heading==WEST && (dx -= 1)

    robot.position = Point(robot.position.x + dx,
                          robot.position.y + dy)
    robot
end

function move!(robot::Robot, instructions)
    for instruction in instructions
        if instruction=='L'
            turn_left!(robot)
        elseif instruction=='R'
            turn_right!(robot)
        else #instruction=='A'
            advance!(robot)
        end
    end
    robot
end