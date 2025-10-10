
#!/bin/bash
set -e

# Usage: ./build.sh <branch_name>
  # default to dev if no argument

IMAGE_NAME="mobile-catalog"
DEVELOPER_REGISTRY = "harikumar1997/mobile-catalog-developer:developer"
PRODUCTION_REGISTRY = "harikumar1997/mobile-catalog-production:production"

echo "Building Docker image..."
docker build -t $IMAGE_NAME:latest .

if [ "$BRANCH" == "developer" ]; then
    echo "Tagging image for developer repo..."
    docker tag $IMAGE_NAME:latest $DEVELOPER_IMAGE
elif [ "$BRANCH" == "main" ]; then
    echo "Tagging image for prod repo..."
    docker tag $IMAGE_NAME:latest $PRODUCTION_IMAGE
else
    echo "Unknown branch '$BRANCH'. Tagging as latest locally."
fi

echo "Build complete."
