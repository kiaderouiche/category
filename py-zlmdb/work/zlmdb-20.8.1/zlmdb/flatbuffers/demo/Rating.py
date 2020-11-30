# automatically generated by the FlatBuffers compiler, do not modify

# namespace: demo

import flatbuffers

class Rating(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAsRating(cls, buf, offset):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = Rating()
        x.Init(buf, n + offset)
        return x

    # Rating
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # Rating
    def Name(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # Rating
    def Rating(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Float32Flags, o + self._tab.Pos)
        return 0.0

def RatingStart(builder): builder.StartObject(2)
def RatingAddName(builder, name): builder.PrependUOffsetTRelativeSlot(0, flatbuffers.number_types.UOffsetTFlags.py_type(name), 0)
def RatingAddRating(builder, rating): builder.PrependFloat32Slot(1, rating, 0.0)
def RatingEnd(builder): return builder.EndObject()
