
#!/bin/bash
set -e

# Usage: ./build.sh <branch_name>
BRANCH=${1:-main}
  # default to dev if no argument

IMAGE_NAME="mobile-catalog"
DEVELOPER_REGISTRY="harikumar1997/mobile-catalog-developer:${BRANCH}"
PRODUCTION_REGISTRY="harikumar1997/mobile-catalog-production:${BRANCH}"

echo "Building Docker image..."
docker build -t $IMAGE_NAME:latest -f build/Dockerfile .

if [ "$BRANCH" == "developer" ]; then
    echo "Tagging image for developer repo..."
    docker tag $IMAGE_NAME:latest $DEVELOPER_REGISTRY
elif [ "$BRANCH" == "main" ]; then
    echo "Tagging image for prod repo..."
    docker tag $IMAGE_NAME:latest $PRODUCTION_REGISTRY
else
    echo "Unknown branch '$BRANCH'. Tagging as latest locally."
fi

echo "Build completed successfully..."
