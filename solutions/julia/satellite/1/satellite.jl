struct Tree
    root::String
    left::Union{Tree, Nothing}
    right::Union{Tree, Nothing}
end

function tree_from_traversals(preorder, inorder)
    if length(preorder)!=length(inorder)
        throw(ArgumentError("traversals must have same length"))
    end
    if sort(preorder)!=sort(inorder)
        throw(ArgumentError("traversals must have the same elements"))
    end
    if unique(preorder)!=preorder
        throw(ArgumentError("traversals can't have repeated items"))
    end
    if unique(inorder)!=inorder
        throw(ArgumentError("traversals can't have repeated items"))
    end
    build_tree(preorder, inorder)
end

function build_tree(preorder,inorder)
    isempty(preorder) && return nothing
    root = preorder[1]
    rindx = findfirst(x->x==root, inorder)
    left = build_tree(preorder[2:rindx],inorder[1:rindx-1])
    right = build_tree(preorder[rindx+1:end],inorder[rindx+1:end])
    Tree(root, left, right)
end