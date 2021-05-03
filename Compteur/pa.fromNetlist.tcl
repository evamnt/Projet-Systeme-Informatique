
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Compteur -dir "/home/moenne-l/4IR/TD_ArchiMat/Compteur/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/moenne-l/4IR/TD_ArchiMat/Compteur/Compteur.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/moenne-l/4IR/TD_ArchiMat/Compteur} }
set_property target_constrs_file "Compteur.ucf" [current_fileset -constrset]
add_files [list {Compteur.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
