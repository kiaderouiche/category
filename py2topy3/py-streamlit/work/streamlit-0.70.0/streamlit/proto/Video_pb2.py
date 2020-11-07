# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: streamlit/proto/Video.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='streamlit/proto/Video.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x1bstreamlit/proto/Video.proto\"\x97\x01\n\x05Video\x12\x0b\n\x03url\x18\x06 \x01(\t\x12\x12\n\nstart_time\x18\x03 \x01(\x05\x12\x19\n\x04type\x18\x05 \x01(\x0e\x32\x0b.Video.Type\"2\n\x04Type\x12\n\n\x06UNUSED\x10\x00\x12\n\n\x06NATIVE\x10\x01\x12\x12\n\x0eYOUTUBE_IFRAME\x10\x02J\x04\x08\x01\x10\x02J\x04\x08\x02\x10\x03J\x04\x08\x04\x10\x05R\x06\x66ormatR\x04\x64\x61tab\x06proto3'
)



_VIDEO_TYPE = _descriptor.EnumDescriptor(
  name='Type',
  full_name='Video.Type',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='UNUSED', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='NATIVE', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='YOUTUBE_IFRAME', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=101,
  serialized_end=151,
)
_sym_db.RegisterEnumDescriptor(_VIDEO_TYPE)


_VIDEO = _descriptor.Descriptor(
  name='Video',
  full_name='Video',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='url', full_name='Video.url', index=0,
      number=6, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='start_time', full_name='Video.start_time', index=1,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='type', full_name='Video.type', index=2,
      number=5, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _VIDEO_TYPE,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=32,
  serialized_end=183,
)

_VIDEO.fields_by_name['type'].enum_type = _VIDEO_TYPE
_VIDEO_TYPE.containing_type = _VIDEO
DESCRIPTOR.message_types_by_name['Video'] = _VIDEO
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Video = _reflection.GeneratedProtocolMessageType('Video', (_message.Message,), {
  'DESCRIPTOR' : _VIDEO,
  '__module__' : 'streamlit.proto.Video_pb2'
  # @@protoc_insertion_point(class_scope:Video)
  })
_sym_db.RegisterMessage(Video)


# @@protoc_insertion_point(module_scope)