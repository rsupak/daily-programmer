require "pathname"
require "open-uri"
require "zip"

def grab_files(dir)
  root = Pathname(dir)
  files = []
  Pathname(root).find do |path|
    files << path if path.file? unless path == root 
  end
  files
end

def extract_zip(file, destination)
  FileUtils.mkdir_p(destination)

  Zip::File.open(file) do |zip_file|
    zip_file.each do |f|
      fpath = File.join(destination, f.name)
      zip_file.extract(f, fpath)
    end
  end
end

def delete_old_files(files, key_substring)
  files.each do |file|
    if file.to_s.include?(key_substring) || file.to_s.include?("tempfile")
      File.delete(file)
    end
  end
end

def download_drivers(tempfile_path)
  zipurl = "https://brightsignbiz.s3.amazonaws.com/firmware/hd4/8.2/8.2.26/brightsign-hd4-update-8.2.26.zip"
  open(tempfile_path, 'wb') { |file| file << URI.open(zipurl).read }
end

def main
  dir_path = Dir.pwd
  key_substring = "bsfw"
  tempfile_path = dir_path + "/tempfile.zip"
  directory_files = grab_files('.')

  delete_old_files(directory_files, key_substring)
  download_drivers(tempfile_path)
  extract_zip(tempfile_path, dir_path)
end

if __FILE__ == $PROGRAM_NAME
  main
end