# Create a (Mutable) Struct BinarySearchTree, which has fields: data, left, right
# Three methods for accessing the fields have been provided to be used in testing
# Your BinarySearchTree should support the extra functionality seen in the tests

mutable struct BinarySearchTree
    data::Union{Int, Nothing}
    left::Union{BinarySearchTree, Nothing}
    right::Union{BinarySearchTree, Nothing}

    BinarySearchTree() = new(nothing, nothing, nothing)
    BinarySearchTree(value::Int) = new(value, nothing, nothing)

    function BinarySearchTree(list::Array{Int})
        new_tree = new(nothing,nothing, nothing)
        for val in list 
            push!(new_tree, val)
        end
        new_tree
    end    
end

nodedata(tree::BinarySearchTree) = tree.data
rightnode(tree::BinarySearchTree) = tree.right
leftnode(tree::BinarySearchTree) = tree.left

function Base.push!(tree::BinarySearchTree, value::Int)
    if isnothing(tree.data) 
        tree.data = value
    elseif value<=tree.data 
        isnothing(tree.left) ? tree.left = BinarySearchTree(value) : push!(tree.left, value)
    else
        isnothing(tree.right) ? tree.right = BinarySearchTree(value) : push!(tree.right, value)
    end
end

function Base.in(val::Int, tree::BinarySearchTree)
    tree.data == val && return true
    if val<=tree.data 
        isnothing(tree.left) ? false : in(val, tree.left)
    else
        isnothing(tree.right) ? false : in(val, tree.right)
    end
end

function Base.sort(tree::Union{BinarySearchTree, Nothing})
    isnothing(tree) && return []
    isnothing(tree.data) && return []
    [sort(tree.left); tree.data; sort(tree.right)]
end