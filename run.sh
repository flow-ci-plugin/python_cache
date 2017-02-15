# ************************************************************
#
# This step will enable/disable cache
#
#   Variables used:
#     $FLOW_ENABLE_CACHE
#     $FLOW_VERSION
#
#   Outputs:
#     $FLOW_ENABLE_CACHE
#
# ************************************************************

if [[ $FLOW_ENABLE_CACHE == 'TRUE' ]]; then
  mkdir -p ~/.pip && touch ~/.pip/pip.conf
  #printf '[global]\ndownload_cache = ~/.cache/pip\n' >> ~/.pip/pip.conf
  printf '\ndownload_cache = ~/.cache/pip\n' >> ~/.pip/pip.conf
  echo 'start python cache'
  FLOW_CACHE_PATH="$CACHE_BASE_URL/$FLOW_VERSION/cache/pip"
  if [[ -d $FLOW_CACHE_PATH ]]; then
    echo "cache exists"
  else
    echo "cache not exists"
    mkdir -p $FLOW_CACHE_PATH
  fi

  cp -R $HOME/.cache/pip/* $FLOW_CACHE_PATH/
  rm -rf $HOME/.cache/pip
  ln -s $FLOW_CACHE_PATH $HOME/.cache
else
  echo 'cache disabled'
fi
