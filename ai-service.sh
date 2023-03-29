wget http://launchpadlibrarian.net/367274644/libgoogle-perftools-dev_2.5-2.2ubuntu3_amd64.deb
wget https://launchpad.net/ubuntu/+source/google-perftools/2.5-2.2ubuntu3/+build/14795286/+files/google-perftools_2.5-2.2ubuntu3_all.deb
wget https://launchpad.net/ubuntu/+source/google-perftools/2.5-2.2ubuntu3/+build/14795286/+files/libtcmalloc-minimal4_2.5-2.2ubuntu3_amd64.deb
wget https://launchpad.net/ubuntu/+source/google-perftools/2.5-2.2ubuntu3/+build/14795286/+files/libgoogle-perftools4_2.5-2.2ubuntu3_amd64.deb

apt -y install libunwind8-dev
dpkg -i ./*.deb && export LD_PRELOAD=libtcmalloc.so && rm ./*.deb

apt -y install -qq aria2
pip install -q xformers==0.0.16
pip install -q triton==2.0.0

git clone -b v2.0 https://github.com/camenduru/stable-diffusion-webui
git clone https://huggingface.co/embed/negative /app/stable-diffusion-webui/embeddings/negative
git clone https://huggingface.co/embed/lora /app/stable-diffusion-webui/models/Lora/positive
wget https://raw.githubusercontent.com/camenduru/stable-diffusion-webui-scripts/main/run_n_times.py -O /app/stable-diffusion-webui/scripts/run_n_times.py
git clone https://github.com/deforum-art/deforum-for-automatic1111-webui /app/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser /app/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/camenduru/stable-diffusion-webui-huggingface /app/stable-diffusion-webui/extensions/stable-diffusion-webui-huggingface
git clone -b v2.0 https://github.com/camenduru/sd-civitai-browser /app/stable-diffusion-webui/extensions/sd-civitai-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /app/stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone https://github.com/Mikubill/sd-webui-controlnet /app/stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/camenduru/openpose-editor /app/stable-diffusion-webui/extensions/openpose-editor
git clone https://github.com/jexom/sd-webui-depth-lib /app/stable-diffusion-webui/extensions/sd-webui-depth-lib
git clone https://github.com/hnmr293/posex /app/stable-diffusion-webui/extensions/posex
git clone https://github.com/camenduru/sd-webui-tunnels /app/stable-diffusion-webui/extensions/sd-webui-tunnels
git clone https://github.com/etherealxx/batchlinks-webui /app/stable-diffusion-webui/extensions/batchlinks-webui
git clone https://github.com/camenduru/stable-diffusion-webui-catppuccin /app/stable-diffusion-webui/extensions/stable-diffusion-webui-catppuccin
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /app/stable-diffusion-webui/extensions/a1111-sd-webui-locon
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg /app/stable-diffusion-webui/extensions/stable-diffusion-webui-rembg
git clone https://github.com/ashen-sensored/stable-diffusion-webui-two-shot /app/stable-diffusion-webui/extensions/stable-diffusion-webui-two-shot

cd /app/stable-diffusion-webui || exit

aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/resolve/main/canny-sd21-safe.safetensors -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o canny-sd21-safe.safetensors
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/resolve/main/depth-sd21-safe.safetensors -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o depth-sd21-safe.safetensors
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/resolve/main/hed-sd21-safe.safetensors -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o hed-sd21-safe.safetensors
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/resolve/main/openpose-sd21-safe.safetensors -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o openpose-sd21-safe.safetensors
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/resolve/main/scribble-sd21-safe.safetensors -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o scribble-sd21-safe.safetensors

aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/raw/main/cldm_v21.yaml -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o canny-sd21-safe.yaml
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/raw/main/cldm_v21.yaml -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o depth-sd21-safe.yaml
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/raw/main/cldm_v21.yaml -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o hed-sd21-safe.yaml
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/raw/main/cldm_v21.yaml -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o openpose-sd21-safe.yaml
aria2c --console-log-level=error -c -x 16 -k 1M -s 16 https://huggingface.co/ckpt/ControlNet/raw/main/cldm_v21.yaml -d /app/stable-diffusion-webui/extensions/sd-webui-controlnet/models -o scribble-sd21-safe.yaml

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt -d /app/stable-diffusion-webui/models/Stable-diffusion -o v2-1_768-ema-pruned.ckpt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/stable-diffusion-2-1/raw/main/v2-inference-v.yaml -d /app/stable-diffusion-webui/models/Stable-diffusion -o v2-1_768-ema-pruned.yaml

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/joachimsallstrom/Double-Exposure-Embedding/resolve/main/dblx.pt -d /app/stable-diffusion-webui/embeddings -o dblx.pt
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/Conflictx/AnimeScreencap/resolve/main/AnimeScreenCap.pt -d /app/stable-diffusion-webui/embeddings -o AnimeScreenCap.pt

sed -i -e '''/    prepare_environment()/a\    os.system\(f\"""sed -i -e ''\"s/dict()))/dict())).cuda()/g\"'' /app/stable-diffusion-webui/repositories/stable-diffusion-stability-ai/ldm/util.py""")''' /app/stable-diffusion-webui/launch.py
sed -i -e 's/fastapi==0.90.1/fastapi==0.89.1/g' /app/stable-diffusion-webui/requirements_versions.txt

mkdir /app/stable-diffusion-webui/extensions/deforum-for-automatic1111-webui/models

python launch.py --listen --api --xformers --enable-insecure-extension-access --theme dark --gradio-queue --multiple