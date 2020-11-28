# automatically generated by the FlatBuffers compiler, do not modify

# namespace: meta

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

# Generic **object documentation** attached to objects in other tables. Primary key of this table is ``oid``.
class Doc(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAsDoc(cls, buf, offset):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = Doc()
        x.Init(buf, n + offset)
        return x

    # Doc
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # OID of the documentation (version).
    # Doc
    def Oid(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # Table of the object being documented.
    # Doc
    def TableOid(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # Doc
    def TableOidAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # Doc
    def TableOidLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # Doc
    def TableOidIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        return o == 0

    # Object (within the table)  being documented.
    # Doc
    def ObjectOid(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # Doc
    def ObjectOidAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # Doc
    def ObjectOidLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # Doc
    def ObjectOidIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        return o == 0

    # When the documentation (version) was created or modified.
    # Doc
    def Modified(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

    # Documentation text format.
    # Doc
    def Format(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, o + self._tab.Pos)
        return 0

    # The actual documentation, serialized according to the documentation format.
    # Doc
    def Document(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(14))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # Doc
    def DocumentAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(14))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # Doc
    def DocumentLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(14))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # Doc
    def DocumentIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(14))
        return o == 0

def DocStart(builder): builder.StartObject(6)
def DocAddOid(builder, oid): builder.PrependUOffsetTRelativeSlot(0, flatbuffers.number_types.UOffsetTFlags.py_type(oid), 0)
def DocAddTableOid(builder, tableOid): builder.PrependUOffsetTRelativeSlot(1, flatbuffers.number_types.UOffsetTFlags.py_type(tableOid), 0)
def DocStartTableOidVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def DocAddObjectOid(builder, objectOid): builder.PrependUOffsetTRelativeSlot(2, flatbuffers.number_types.UOffsetTFlags.py_type(objectOid), 0)
def DocStartObjectOidVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def DocAddModified(builder, modified): builder.PrependUint64Slot(3, modified, 0)
def DocAddFormat(builder, format): builder.PrependUint8Slot(4, format, 0)
def DocAddDocument(builder, document): builder.PrependUOffsetTRelativeSlot(5, flatbuffers.number_types.UOffsetTFlags.py_type(document), 0)
def DocStartDocumentVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def DocEnd(builder): return builder.EndObject()