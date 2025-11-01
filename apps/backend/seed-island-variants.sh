#!/bin/bash

echo "=========================================="
echo "Seeding Island Variants to DynamoDB"
echo "=========================================="
echo ""

# Check if DynamoDB is running
if ! curl -s http://localhost:8000 > /dev/null 2>&1; then
    echo "❌ Error: DynamoDB Local is not running on port 8000"
    echo ""
    echo "Start it with:"
    echo "  docker run -p 8000:8000 amazon/dynamodb-local"
    echo ""
    exit 1
fi

# Check if table exists
TABLE_NAME="IslandVariants"
if ! aws dynamodb describe-table --table-name $TABLE_NAME --endpoint-url http://localhost:8000 > /dev/null 2>&1; then
    echo "Creating table: $TABLE_NAME"
    aws dynamodb create-table \
        --table-name $TABLE_NAME \
        --attribute-definitions AttributeName=id,AttributeType=S \
        --key-schema AttributeName=id,KeyType=HASH \
        --billing-mode PAY_PER_REQUEST \
        --endpoint-url http://localhost:8000
    
    echo "⏳ Waiting for table to be created..."
    sleep 2
fi

# Insert the 3 island variants
echo ""
echo "Inserting island variants..."

aws dynamodb batch-write-item \
    --request-items file://island-variants-seed-data.json \
    --endpoint-url http://localhost:8000

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully seeded 3 island variants:"
    echo "   1. variant-standard (Standard Farm)"
    echo "   2. variant-riverland (Riverland Farm)"
    echo "   3. variant-forest (Forest Farm)"
    echo ""
    echo "Verify with:"
    echo "  aws dynamodb scan --table-name IslandVariants --endpoint-url http://localhost:8000"
    echo ""
    echo "Or test the API:"
    echo "  curl http://localhost:8080/api/IslandVariants"
else
    echo ""
    echo "❌ Failed to seed data"
    exit 1
fi

echo "=========================================="
