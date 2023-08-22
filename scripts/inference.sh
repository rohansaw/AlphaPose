set -x

CONFIG=$1
CKPT=$2
VIDEO=$3
OUTDIR=${4:-"./examples/res"}

if [[ $(lshw -C display | grep vendor) =~ Nvidia ]]; then
  do python scripts/demo_inference.py \
    --cfg ${CONFIG} \
    --checkpoint ${CKPT} \
    --video ${VIDEO} \
    --outdir ${OUTDIR} \
    --detector yolo  --save_img --save_video
else
  do echo "No GPU available"
fi

