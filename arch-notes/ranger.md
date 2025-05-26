## To preview images:
    - Install ueberzugpp
    - See rc.conf


## Preview javascript:
Create custom scope.sh with:
```
    ranger --copy-config=scope
```

Find the function handle_mime and change:
```
    ## Text
    text/* | */xml)
```
to
```
    ## Text
    text/* | */xml | */javascript)
```
