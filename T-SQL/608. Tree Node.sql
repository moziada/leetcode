/* Write your T-SQL query statement below */

-- the node has no parent?
--   Yes -> Root, no -->
--       the node has no child?
--           Yes -> Leaf, No -> Inner

-- get childs of parenting nodes
with full_tree AS (
SELECT child.id AS child_id, node.id AS base_node_id,  node.p_id AS parent_id
FROM Tree node
FULL JOIN Tree child
ON node.id = child.p_id
    ) 
SELECT base_node_id AS id, CASE
            WHEN SUM(full_tree.parent_id) IS NULL THEN 'Root'
            WHEN SUM(full_tree.child_id) IS NULL THEN 'Leaf'
            ELSE 'Inner'
            END AS type
    FROM full_tree
    WHERE full_tree.base_node_id IS NOT NULL
    GROUP BY full_tree.base_node_id