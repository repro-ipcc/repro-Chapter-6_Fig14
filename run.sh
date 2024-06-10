#/bin/sh

eval "$(conda shell.bash hook)"

conda activate ipcc_ch6f14

DIR=Chapter-6_Fig14

# download the source PNG from IPCC
# wget https://www.ipcc.ch/report/ar6/wg1/downloads/figures/IPCC_AR6_WGI_Figure_6_14.png

# Apply changes to produce figure of $DIR
echo Patching $DIR
cd $DIR
patch < ../${DIR}.patch

python CMIP6_global_2D_ann_O3_resp_at_diff_temp_thresholds.py

mv Ann_mean_surf_o3_diff_between_ssp370SST_and_ssp370pdSST_scenario_2D_plot_4_CMIP6_models_MMM_resp_at_NEW_ssp370pdSST_temp_thresholds_horiz_V2_NO_SIG_stip_80pc.pdf IPCC_AR6_WGI_Figure_6_14.pdf

# Remove the changes
git checkout CMIP6_global_2D_ann_O3_resp_at_diff_temp_thresholds.py
