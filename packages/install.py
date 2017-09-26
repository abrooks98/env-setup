#!/usr/bin/python

import subprocess
import sys
from os.path import expanduser, exists, isdir

packages = {
  'autoconf' : {
    'type'    : 'download',
    'version' : "2.69",
    'dirname' : "@NAME@-@VERSION@",
    'website' : "https://ftp.gnu.org/gnu/@NAME@/@NAME@-@VERSION@.tar.gz",
    'prefix'  : "@HOME@/opt/autotools",
    'verify'  : "@PREFIX@/bin/@NAME@",
    'install' : "./configure --prefix=@PREFIX@; make install",
    'extension' : ".tar.gz",
    'dependencies' : ['m4']
  },
  'automake' : {
    'type'    : 'download',
    'version' : "1.51.1",
    'dirname' : "@NAME@-@VERSION@",
    'website' : "https://ftp.gnu.org/gnu/@NAME@/@NAME@-@VERSION@.tar.gz",
    'prefix'  : "@HOME@/opt/autotools",
    'verify'  : "@PREFIX@/bin/@NAME@",
    'install' : "./configure --prefix=@PREFIX@; make install",
    'extension' : ".tar.gz",
    'dependencies' : ['autoconf']
  },
  'libtool' : {
    'type'    : 'download',
    'version' : "2.4.6",
    'dirname' : "@NAME@-@VERSION@",
    'website' : "https://ftp.gnu.org/gnu/@NAME@/@NAME@-@VERSION@.tar.gz",
    'prefix'  : "@HOME@/opt/autotools",
    'verify'  : "@PREFIX@/bin/@NAME@",
    'install' : "./configure --prefix=@PREFIX@; make install",
    'extension' : ".tar.gz",
    'dependencies' : ['automake']
  },
  'm4' : {
    'type'    : 'download',
    'version' : "1.4.17",
    'dirname' : "@NAME@-@VERSION@",
    'website' : "https://ftp.gnu.org/gnu/@NAME@/@NAME@-@VERSION@.tar.gz",
    'prefix'  : "@HOME@/opt/autotools",
    'verify'  : "@PREFIX@/bin/@NAME@",
    'install' : "./configure --prefix=@PREFIX@; make install",
    'extension' : ".tar.gz",
    'dependencies' : []
  },
  'tmux' : {
    'type'    : 'download',
    'version' : "2.5",
    'dirname' : "@NAME@-@VERSION@",
    'website' : "https://github.com/@NAME@/@NAME@/releases/download/@VERSION@/@NAME@-@VERSION@.tar.gz",
    'prefix'  : "@HOME@/opt/@NAME@-@VERSION@",
    'verify'  : "@PREFIX@/bin/@NAME@",
    'install' : "./configure --prefix=@PREFIX@; make install",
    'extension' : ".tar.gz",
    'dependencies' : ['libevent', 'ncurses']
  },
  'libevent' : {
    'type'    : 'apt',
    'install' : "sudo apt-get install libevent-dev",
    'dependencies' : []
  },
  'ncurses' : {
    'type'    : 'apt',
    'install' : "sudo apt-get install libncurses5 libncurses5-dev",
    'dependencies' : []
  },
}

def run(command, directory):
  if directory == "":
    print("Running command in " + directory + ":")
    print(command)
    process = subprocess.Popen(command, shell=True)
  else:
    print("Running command in " + directory + ":")
    print(command)
    process = subprocess.Popen(command, cwd=directory, shell=True)

  process.communicate()

def replace(s, name, version):
  s = s.replace("@NAME@", name)
  s = s.replace("@VERSION@", version)
  s = s.replace("@HOME@", expanduser("~"))
  return s

def install(dictionary, key, value):
  name = key

  if value['type'] == 'apt':
    for dependence in value['dependencies']:
      if dependence in dictionary:
        dep_value = dictionary.pop(dependence)
        install(dictionary, dependence, dep_value)

    run(value['install'], "")
  else:
    version = value['version']
    website = replace(value['website'], name, version)
    prefix  = replace(value['prefix'], name, version)
    dirname = replace(value['dirname'], name, version)
    verify  = replace(value['verify'], name, version)
    verify  = verify.replace("@PREFIX@", prefix)
    cmd = value['install']
    cmd = cmd.replace("@PREFIX@", prefix)
    tarname = dirname + value['extension']

    for dependence in value['dependencies']:
      if dependence in dictionary:
        dep_value = dictionary.pop(dependence)
        install(dictionary, dependence, dep_value)

    if not exists(verify):
      if not exists(tarname):
        run("wget " + website, "")

      if not isdir(dirname):
        run("tar zxf " + tarname, "")

      run(cmd, dirname)
      run("rm -rf " + dirname, "")

def main(args):
  dictionary = packages
  while len(dictionary) != 0:
    (key, value) = dictionary.popitem()
    install(dictionary, key, value)

if __name__ == "__main__":
  main(sys.argv)
