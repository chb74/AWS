#!/bin/tcsh

# -- By chb@mz.co.kr -- #
# -- On Feb 28, 2018 -- #

source Libs 
set count = 0

foreach i (`seq 1 100`)
        set TargetGroups[$i] = (`jq '.TargetGroups[$i].TargetGroupName' Prd.Target.Group.txt ` )
        echo $count, $TargetGroups[$i]

        if ( ! $TargetGroup[$i] ) then
                break
        endif
        @ count += 1
end
