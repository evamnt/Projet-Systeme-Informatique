
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Compteur -dir "/home/moenne-l/4IR/TD_ArchiMat/Compteur/planAhead_run_2" -part xc6slx16csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/moenne-l/4IR/TD_ArchiMat/Compteur/Compteur.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/moenne-l/4IR/TD_ArchiMat/Compteur} }
set_property target_constrs_file "Compteur.ucf" [current_fileset -constrset]
add_files [list {Compteur.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
read_xdl -file "/home/moenne-l/4IR/TD_ArchiMat/Compteur/Compteur.xdl"
if {[catch {read_twx -name results_1 -file "/home/moenne-l/4IR/TD_ArchiMat/Compteur/Compteur.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/moenne-l/4IR/TD_ArchiMat/Compteur/Compteur.twx\": $eInfo"
}
