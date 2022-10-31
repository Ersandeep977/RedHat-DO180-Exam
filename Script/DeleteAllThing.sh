#! /bin/bash
# This file content how to clear all the contet

echo ""
# To Show all the Images
podman images
echo ""
echo "To Show all the Images...."
echo ""
# To Show all the Container
podman container list
echo ""
echo "To Show all the Container Running ....."
echo ""
# To Show all the Container
podman ps -a
echo ""
echo "To Show all the Container Running and non Running....."
echo ""
# To Delete all the Images on Podman
podman rm --all
echo ""
echo "Delete all the Container .....'OK..!!!'.."
echo ""
# To Delete all the Contai:ner in podman
podman container kill --all
echo ""
echo "Delete all the Images .....'OK..!!!'.."
echo ""
# To Clear all the thins
podman kill -all
echo ""
echo ""
echo "Clear All......OK"
read "Do You Want to ShutDown System.. "
date
