#!/usr/bin/env ruby
require "rubygems"
require "thor"

class MyEducation < Thor
  def self.exit_on_failure?
    true
  end

  desc "setup_root", "Creates my_education directory in users home directory"
  def setup_root
    homepath = "~/Documents/my_education/"
    system "mkdir -m 700 -p #{homepath}archives"
    puts "\nCreated #{homepath}archives"
  end

  desc "add_class TERM_NAME CLASS_NAME",
       "Create a new directories in TERM_NAME i.e. uw2024winter and CLASS_NAME i.e. CSE311"
  def add_class(term_name, class_name)
    homepath = "~/Documents/my_education"
    dirs = %w[materials homework exams]
    system "mkdir -m 700 -p #{homepath}/#{term_name}/#{class_name}"
    puts "\nCreated ~/Documents/#{term_name}"
    dirs.each { |dir|
      system "mkdir -m 700 -p #{homepath}/#{term_name}/#{class_name}/#{dir}"
      puts "Created #{homepath}/#{term_name}/#{class_name}/#{dir}"
    }
  end

  desc "archive", "create a tar archive in ~/Documents/my_education"
  def archive
    homepath = "~/Documents/my_education/"
    system "tar -C #{homepath}archives --exclude .DS_Store --exclude #{homepath}archives \
            -czvf #{homepath}archives/my_education_#{Time.now.strftime("%d%m%Y-%H%M")}.tar \
            #{homepath}"
  end

  desc "sThreeArchive", "uses environment variable and AWS SSO to copy archive files to S3"
  def sThreeSync
    target = ENV::fetch("S3_ARCHIVE")
    # system "aws s3 cp . s3://#{target}/ --recursive  --exclude \"*\" --include \"*.tar\""
    # system "aws s3 ls s3://#{target}"
    # todo: leverage Ruby AWS SDK to only copy the diff between local archive and S3 bucket.
  end

  def help(command = nil, subcommand = nil)
    super
  end
end

# MyEducation.start