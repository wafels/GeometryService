# curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
# apt-get install git-lfs
# dpkg --install git-lfs_2.1.0_amd64.deb
# git lfs install

# git clone https://github.com/Helioviewer-Project/GeometryService.git
# cd GeometryService
# git pull origin
# cd -

docker build --rm -t geometry-service .
