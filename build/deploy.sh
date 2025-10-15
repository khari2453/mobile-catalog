
#!/bin/bash
set -e

# Usage: ./deploy.sh <branch_name>

BRANCH=${1:-developer}
  # default to dev if no argument

IMAGE_NAME="mobile-catalog"
DEVELOPER_REGISTRY="harikumar1997/mobile-catalog-developer:${BRANCH}"
PRODUCTION_REGISTRY="harikumar1997/mobile-catalog-production:${BRANCH}"

cd "$(dirname "$0")"

# Stop previous container
echo "Stopping old container if exists..."
docker-compose down || true

# Update docker-compose.yml dynamically
if [ "$BRANCH" == "developer" ]; then
    sed -i "s|image: .*|image: $DEVELOPER_REGISTRY|" docker-compose.yml
elif [ "$BRANCH" == "main" ]; then
    sed -i "s|image: .*|image: $PRODUCTION_REGISTRY|" docker-compose.yml
fi

# Start container
echo "Starting container..."
docker-compose up -d

echo "Deployment completed for branch ... $BRANCH!"
