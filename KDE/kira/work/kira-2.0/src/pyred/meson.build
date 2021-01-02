
configure_file(output : 'config.h', configuration : conf_data)

pyred_src = [
  'coeff_helper.cpp',
  'coeff_int.cpp',
  'coeff_vec.cpp',
  'integrals.cpp',
  'interface.cpp',
  'keyvaluedb.cpp',
  'parser.cpp',
  'relations.cpp']

sqlite_src = ['../sqlite3/sqlite3.c']

gzstream_src = ['../gzstream/gzstream.cpp']

pyred = static_library(
  'pyred',
  pyred_src + sqlite_src + gzstream_src,
  include_directories : include_dirs,
  dependencies : deps,
  install : false)
