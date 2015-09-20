#!/bin/csh
# David Shin
# Sun Jul 12 15:54:54 PDT 2015
# Description: Script makes a basic figure of biological assembly of supplied .pdb
#              files given in the foreach loop.
#              Script reads from a pymol setup file to control representations
#              Script will read an optional file containing a list of .pdb files
#              This list should be a single column containing 4 character codes
# Modified from: 
# Usage: ./make_figures.csh <your setup file>
#        ./make_figures.csh <your setup file> <your optional list of structures>
# Example: ./make_figures.csh make_figures_setup.pml make_figures_test_pdb_list 
##########################################################


####################################################
# USER COMMENT/UNCOMMENT METHOD TO INPUT FILES BELOW
####################################################

### User supplied .pdb codes go here in foreach loop if not providing list
#foreach i ( 1PZN 3F7L 4W9M 3DSC )       # comment out if reading from a list

### Reads user supplied .pdb code list provided from command line
foreach i ( "`cat $2`")                 # comment out if supplying files above, $2 is second arg

####################################################
# USER COMMENT/UNCOMMENTS USUALLY NOT NECESSARY
####################################################

    ### Make a tmp script to fetch and open .pdb files as biological assembly
    echo "### fetch the .pdb file and open it" > tmp1
    echo "fetch $i, type=pdb1, multiplex=1, async=0" >> tmp1
    echo ""                  >> tmp1

    ### Make a tmp script to take and save 4 pics with different rotations
    echo "### Take pics with 4 rotations" > tmp2
    echo "viewport 800, 800" >> tmp2    # match viewport and ray values
    echo "zoom complete = 1" >> tmp2
    echo "ray 800, 800"      >> tmp2
    echo "png $i-1.png"      >> tmp2
    echo "rotate x, 90"      >> tmp2    # change rotation values if you don't get a good view
    echo "zoom complete = 1" >> tmp2
    echo "ray 800, 800"      >> tmp2
    echo "png $i-2.png"      >> tmp2
    echo "rotate y, 90"      >> tmp2
    echo "zoom complete = 1" >> tmp2
    echo "ray 800, 800"      >> tmp2
    echo "png $i-3.png"      >> tmp2
    echo "rotate x, 60"      >> tmp2
    echo "zoom complete = 1" >> tmp2
    echo "ray 800, 800"      >> tmp2
    echo "png $i-4.png"      >> tmp2
    echo "save $i.pse"       >> tmp2    # comment out if you don't want to save .pse files
    echo ""                  >> tmp2
 
    ### Combine scripts to make a single specific script, $1 is user supplied setup file
    cat tmp1 $1 tmp2 > fig-script-$i.pml

    ### Execute specific job
    pymol -c -d @fig-script-$i.pml

    ### Remove specific temporary files
    /bin/rm -rf @fig-script-$i.pml      # comment out if you want to keep file
    /bin/rm -rf tmp?                    # comment out if you want to keep files

end
