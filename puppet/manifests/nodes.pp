
node /linode.rusa.org/ {
    include website
    include devtools
    include systools
    include users
    include sudoers
    include site-linode
}

node /www.rusa.org/ {
    include website
    include devtools
    include systools
    include users
    include sudoers
    include mail
}
