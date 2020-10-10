import os
from urllib.request import urlopen
from zipfile import ZipFile

def delete_old_files(dir_path, key_substring):
    for root, dirs, files in os.walk(dir_path):
        for file in files:
            if (key_substring or "temp") in file:
                os.remove(file)


def download_drivers(dir_path):
    zipurl = "https://brightsignbiz.s3.amazonaws.com/firmware/hd4/8.2/8.2.26/brightsign-hd4-update-8.2.26.zip"
    zipresp = urlopen(zipurl)
    tempzip = open(dir_path + "/tempfile.zip", "wb")
    tempzip.write(zipresp.read())
    tempzip.close()


def extract_zip(dir_path):
    download_drivers(dir_path)
    zf = ZipFile(dir_path + "/tempfile.zip")
    zf.extractall(dir_path)
    zf.close()


def main():
    dir_path = os.path.dirname(os.path.realpath(__file__))
    key_substring = "bsfw"

    delete_old_files(dir_path, key_substring)
    download_drivers(dir_path)
    extract_zip(dir_path)


if __name__ == "__main__":
    main()