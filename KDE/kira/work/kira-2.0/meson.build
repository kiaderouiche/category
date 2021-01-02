
project(
  'Kira',
  ['cpp', 'c'],
  version : '2.0',
  license : 'GPL3',
  default_options : [
    'cpp_std=c++14',
    'c_std=c11',
    'buildtype=release',
    'warning_level=3',
    'libdir=lib'])

# libdir=lib: avoid using libdir=lib/x86_64-linux-gnu on debian-like systems,
# because the linker will find libraries installed there only
# if the prefix is /usr (whereas the default prefix is /usr/local).
# This seems to be a bug in the distribution (at least in Debian <=10).

c_compiler = meson.get_compiler('c')
cpp_compiler = meson.get_compiler('cpp')

# ===== #
# Flags #
# ===== #

# Avoid warnings when compiling SQLite3 if possible.
if c_compiler.get_id() == 'gcc' and c_compiler.version().version_compare('>=7')
  add_project_arguments('-Wimplicit-fallthrough=0', language : 'c')
endif
if c_compiler.get_id() == 'gcc' and c_compiler.version().version_compare('>=8')
  add_project_arguments('-Wno-cast-function-type', language : 'c')
endif
if get_option('static')
  add_project_link_arguments('-static', language : 'cpp')
endif

# ==================== #
# Configuration header #
# ==================== #

conf_data = configuration_data()
conf_data.set_quoted('VERSION', meson.project_version())
# Optional Kyoto Cabinet database backend for pyRed.
conf_data.set('PYRED_KCDB', get_option('kyotocabinet'))
# pyRed option to make the modular arithmetic work correctly in Valgrind.
conf_data.set('VALGRIND', get_option('buildtype').startswith('debug'))
conf_data.set('KIRAFIREFLY', get_option('firefly'))
conf_data.set('GZSTREAM_NAMESPACE', 'pyred_gzstream')
conf_data.set('PYRED_PP_NCOEFFCLASSES', get_option('pyred_ncoeffclasses'))

# ============ #
# Dependencies #
# ============ #

rpath = '' # if empty string, rpath will not be set

# Dependencies which are needed by Kira, but not by pyRed.
deps_kira = [dependency('ginac', static : get_option('static'))]

# Dependencies which are needed both by Kira and pyRed.
deps = [
  dependency('threads', static : get_option('static')),
  dependency('zlib', static : get_option('static'))]

deps += dependency(
  'yaml-cpp',
  fallback : ['yaml-cpp', 'yaml_dep'],
  static : get_option('static'))

# SQLite needs libdl which privides no pkg-config file.
# "required : false", because e.g. on BSD there is no separate dl library.
if get_option('static')
  libdl = c_compiler.find_library('dl', required : false, static : true)
else
  libdl = c_compiler.find_library('dl', required : false)
endif
if libdl.found()
  deps += libdl
endif

if get_option('kyotocabinet')
  deps += dependency('kyotocabinet', static : get_option('static'))
endif

if get_option('firefly')
  firefly_dep = dependency(
    'firefly',
    fallback : ['firefly', 'firefly_dep'],
    static : get_option('static'))
  deps_kira += firefly_dep
  if firefly_dep.type_name() == 'internal'
    rpath = join_paths(get_option('prefix'),get_option('libdir'))
  else
    if get_option('flint')
      message('Option flint=true has no effect, because an already installed ' +
              'FireFly library is used.')
    endif
    if get_option('mpi')
      message('Option mpi=true has no effect, because an already installed ' +
              'FireFly library is used.')
    endif
  endif
endif

if get_option('jemalloc')
  deps += dependency('jemalloc', static : get_option('static'))
endif

# ====================== #
# Work in subdirectories #
# ====================== #

rootdir_cppdef = '-DPYRED_ROOT_DIR="' + meson.current_source_dir() + '"'
include_dirs = include_directories('src')

subdir('src')

if get_option('pyredtests')
  subdir('tests/pyred')
endif
