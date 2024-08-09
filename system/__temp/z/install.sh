local pkgName=$2 # rust, cargo

if [ "$pkgName" = "all" ] || [ "$pkgName" = "--all" ]; then
  import "z/install/_all"
elif [ "$pkgName" = "list" ] || [ "$pkgName" = "--list" ]; then
  import "z/install/_list"
elif [ "$pkgName" = "" ]; then
  echo-error "Empty package name, try 'all' or 'list' or name of package"
elif [ -f "$BASEDIR/z/install/$pkgName.sh" ]; then

  install() {
    echo "Installing $pkgName..."
    import "z/install/$pkgName"
  }

  pkg-install-exec $pkgName install

else
  echo-error "Unknown package name '$pkgName'"
fi
