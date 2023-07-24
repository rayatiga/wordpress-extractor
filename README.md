# wordpress-extractor

Extracting from WordPress downloaded file (latest.tar.gz) to custom name directory readable www-data ownership and ready to use.

## installation

```bash
$ git clone https://github.com/rayatiga/wordpress-extractor.git
```

## preparing

Go to inside `wordpress-extractor` directory

```bash
$ cd wordpress-installer/
```

Make `wp-install.sh` executable

```bash
$ chmod +x wp-install.sh
```

## using

Move to WordPress root directory (e.g., `/var/www/html/`)

```bash
$ cd /var/www/html/
```

Make sure file `latest.tar.gz` is inside the WordPress root directory (check with `ls` command)

Execute with `sudo` or `root` privileges

```bash
$ sudo ./makewpdir.sh
```

or

```bash
$ sudo sh makewpdir.sh
```
