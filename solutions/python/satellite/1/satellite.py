def tree_from_traversals(preorder, inorder):
    if len(preorder)!=len(inorder):
        raise ValueError("traversals must have the same length")
    spreo = set(preorder)
    sino = set(inorder)
    if spreo != sino:
        raise ValueError("traversals must have the same elements")
    elif len(spreo)!=len(preorder) or len(sino)!=len(inorder):
        raise ValueError("traversals must contain unique items")
    return build_tree(preorder, inorder)

def build_tree(preorder, inorder):
    if len(preorder)==0:
        return {}
    out = {"v" : preorder[0]}
    rindex = inorder.index(preorder[0])
    left = build_tree(preorder[1:rindex+1], inorder[0:rindex])
    right = build_tree(preorder[rindex+1:], inorder[rindex+1:])
    out.update({"l" : left, "r" : right})
    return out
    
    
