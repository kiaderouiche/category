# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: streamlit/proto/Favicon.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='streamlit/proto/Favicon.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x1dstreamlit/proto/Favicon.proto\"\x16\n\x07\x46\x61vicon\x12\x0b\n\x03url\x18\x01 \x01(\tb\x06proto3'
)




_FAVICON = _descriptor.Descriptor(
  name='Favicon',
  full_name='Favicon',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='url', full_name='Favicon.url', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=33,
  serialized_end=55,
)

DESCRIPTOR.message_types_by_name['Favicon'] = _FAVICON
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Favicon = _reflection.GeneratedProtocolMessageType('Favicon', (_message.Message,), {
  'DESCRIPTOR' : _FAVICON,
  '__module__' : 'streamlit.proto.Favicon_pb2'
  # @@protoc_insertion_point(class_scope:Favicon)
  })
_sym_db.RegisterMessage(Favicon)


# @@protoc_insertion_point(module_scope)
