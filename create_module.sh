#!/bin/bash

read -p "Enter module name: " moduleName

echo "Create $moduleName module"

echo "Creating Presentation folder"
mkdir -p lib/features/$moduleName/presentation/controller
mkdir -p lib/features/$moduleName/presentation/screen
mkdir -p lib/features/$moduleName/presentation/widgets

echo "Creating Domain folder"
mkdir -p lib/features/$moduleName/domain/model
mkdir -p lib/features/$moduleName/domain/usecase
mkdir -p lib/features/$moduleName/domain/repository

echo "Creating Data folder"
mkdir -p lib/features/$moduleName/data/datasource/local
mkdir -p lib/features/$moduleName/data/datasource/remote
mkdir -p lib/features/$moduleName/data/datasource/model
mkdir -p lib/features/$moduleName/data/repository

echo "Creating Wiring folder"
mkdir -p lib/features/$moduleName/wiring

echo "Done!"
