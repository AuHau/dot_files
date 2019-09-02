case "$OSTYPE" in
  darwin*)  install-darwin "$@" ;; 
  linux*)   install-linux "$@" ;;
  *)        echo "Unsupported OS: $OSTYPE"; ;;
esac