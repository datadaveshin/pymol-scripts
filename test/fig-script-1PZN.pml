### fetch the .pdb file and open it
fetch 1PZN, type=pdb1, multiplex=1, async=0

### Background setup
## Default for this script is to have no background (clear)
## to alleviate needing to crop each picture, this is done with
## turning off the opaque background
#bg_color black
#bg_color white
set ray_opaque_background, off  

### Show Selections General
hide everything
show cartoon

### Color chains differently  
## easy way:
#util.color_chains("(name ca)",_self=cmd)
util.color_chains("(all and elem c)",_self=cmd)  #should deal with dna

## hard way:
# select chainA, chain A
# color yellow, chain A and name ca
# 

### Show DNA bases
set cartoon_ring_finder, 1
set cartoon_ring_mode, 3
set cartoon_ring_transparency, 0.8
set cartoon_ladder_mode, 1

### Show metals
show spheres, elem ca
show spheres, elem cu
show spheres, elem fe
show spheres, elem mg
show spheres, elem mn
show spheres, elem zn

### Show nucleotides
show sticks, resname ATP
show sticks, resname ADP
show sticks, resname AMP
show sticks, resname ANP
show sticks, resname AGS





### Take pics with 4 rotations
viewport 800, 800
zoom complete = 1
ray 800, 800
png 1PZN-1.png
rotate x, 90
zoom complete = 1
ray 800, 800
png 1PZN-2.png
rotate y, 90
zoom complete = 1
ray 800, 800
png 1PZN-3.png
rotate x, 60
zoom complete = 1
ray 800, 800
png 1PZN-4.png
save 1PZN.pse

