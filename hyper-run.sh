for SG in 0.6 0.7 0.8
do
        for TS in 0.1 0.05 0.125
        do
            python train.py --root_dir=$EXP_DIR/baselines/minitaur-sg-${SG}-ts-${TS} \
                --gin_file=minitaur_default.gin --gin_file=sac_safe_online.gin \
                --gin_file=networks.gin --gin_param="safe_sac_agent.SafeSacAgentOnline.safety_gamma = ${SG}" \
                --gin_param="safe_sac_agent.SafeSacAgentOnline.target_safety = ${TS}" &> ~/outs/minitaur-sg-${SG}-ts-${TS}.out&
        done
done