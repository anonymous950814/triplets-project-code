#!/bin/bash -l
#SBATCH -J gpt-testing
#SBATCH -N 1
#SBATCH --ntasks-per-node=2
#SBATCH --nodelist=node[010-014]
#SBATCH --gpus=1
#SBATCH --mail-type=START,END,FAIL
#SBATCH --mail-user=<add email here>

echo "== Starting run at $(date)"
echo "== Job ID: ${SLURM_JOBID}"
echo "== Node list: ${SLURM_NODELIST}"
echo "== Submit dir: ${SLURM_SUBMIT_DIR}"
echo "== Scratch dir: ${TMPDIR}"

# module load shared 2024
# module load 2024 PyTorch-bundle/2.1.2-foss-2023a-CUDA-12.1.1
pip install -r ../requirements.txt
#pip install torch==2.3.1
#pip install transformers==5.0.0rc0

# source ../.venv/bin/activate
python generate_triplets_gpt.py