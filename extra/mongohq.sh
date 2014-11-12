#!/usr/bin/env bash

echo "MongoHQ" | indent
echo "export MONGO_URL=\${MONGO_URL:-\$MONGOHQ_URL}" > $BUILD_DIR"/.profile.d/mongo.sh"
