# export BUILDKIT_PROGRESS=plain
export DOCKER_BUILDKIT=1
export HF_TOKEN=<HF_TOKEN>
export MODEL_NAME="charisma-entertainment/llama3.1-story-structure"
export QUANTIZATION=bitsandbytes
export LOAD_FORMAT=bitsandbytes
export MAX_MODEL_LEN=4096
export ENFORCE_EAGER=true
export OPENAI_SERVED_MODEL_NAME_OVERRIDE="charismatic-llm"
export DTYPE="float16"

# aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 891376923046.dkr.ecr.eu-west-2.amazonaws.com

docker build -t 891376923046.dkr.ecr.eu-west-2.amazonaws.com/llm-repo:latest \
    --secret id=HF_TOKEN \
    --build-arg MODEL_NAME=$MODEL_NAME \
    --build-arg QUANTIZATION=$QUANTIZATION \
    --build-arg LOAD_FORMAT=$LOAD_FORMAT \
    --build-arg MAX_MODEL_LEN=$MAX_MODEL_LEN \
    .

# docker push 891376923046.dkr.ecr.eu-west-2.amazonaws.com/llm-repo:latest    
