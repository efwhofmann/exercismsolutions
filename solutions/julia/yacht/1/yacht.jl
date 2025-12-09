
cat_dict = Dict("ones"=>1, "twos"=>2, "threes"=>3, "fours"=>4, "fives"=>5, "sixes"=>6,  "full house"=>7, "four of a kind"=>8, "little straight"=>9, "big straight"=>10, "choice"=>11, "yacht"=>12)

count_by_number(dice, n) = length(filter(d->d==n, dice))

score_by_number(dice, n) = n*count_by_number(dice, n)

score_choice(dice) = sum(dice)

score_little_straight(dice) = sort(dice)==[1,2,3,4,5] ? 30 : 0

score_big_straight(dice) = sort(dice)==[2,3,4,5,6] ? 30 : 0

score_yacht(dice) = count_by_number(dice, dice[1])==5 ? 50 : 0

function score_full_house(dice)
    sorted = sort(dice)
    a = count_by_number(sorted, sorted[1])
    b = count_by_number(sorted, last(sorted))
    if (a==2 && b==3) || (a==3 && b==2)
        score_choice(sorted)
    else
        return 0
    end
end

function score_four_of_a_kind(dice)
    sorted = sort(dice)
    if count_by_number(sorted, sorted[1])>=4
         sorted[1]*4
    elseif count_by_number(sorted, last(sorted))>=4
         last(sorted)*4
    else
         0
    end
end

function score(dice, category)
    category_number = cat_dict[category]
    if category_number<=6
        score_by_number(dice, category_number)
    elseif category_number==7
        score_full_house(dice)
    elseif category_number==8
        score_four_of_a_kind(dice)
    elseif category_number==9
        score_little_straight(dice)
    elseif category_number==10
        score_big_straight(dice)
    elseif category_number==11
        score_choice(dice)
    else #category_number==12
        score_yacht(dice)
    end
end