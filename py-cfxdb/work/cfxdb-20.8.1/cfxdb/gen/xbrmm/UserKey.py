# automatically generated by the FlatBuffers compiler, do not modify

# namespace: xbrmm

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

class UserKey(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAsUserKey(cls, buf, offset):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = UserKey()
        x.Init(buf, n + offset)
        return x

    # UserKey
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # User key - a Ed25519 public key - for authenticating using WAMP-cryptosign.
    # UserKey
    def Pubkey(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # UserKey
    def PubkeyAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # UserKey
    def PubkeyLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # UserKey
    def PubkeyIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        return o == 0

    # Timestamp (epoch time in ns) of initial creation of this record.
    # UserKey
    def Created(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint64Flags, o + self._tab.Pos)
        return 0

    # ID of XBR network member this user key is owned by (foreign key to xbr.Member)
    # UserKey
    def Owner(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # UserKey
    def OwnerAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # UserKey
    def OwnerLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # UserKey
    def OwnerIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        return o == 0

    # Wallet address of XBR network member this user key is owned by (foreign key to xbr.Member)
    # UserKey
    def WalletAddress(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # UserKey
    def WalletAddressAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # UserKey
    def WalletAddressLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # UserKey
    def WalletAddressIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        return o == 0

    # User key delegate signature
    # UserKey
    def Signature(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 1))
        return 0

    # UserKey
    def SignatureAsNumpy(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            return self._tab.GetVectorAsNumpy(flatbuffers.number_types.Uint8Flags, o)
        return 0

    # UserKey
    def SignatureLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # UserKey
    def SignatureIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        return o == 0

def UserKeyStart(builder): builder.StartObject(5)
def UserKeyAddPubkey(builder, pubkey): builder.PrependUOffsetTRelativeSlot(0, flatbuffers.number_types.UOffsetTFlags.py_type(pubkey), 0)
def UserKeyStartPubkeyVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def UserKeyAddCreated(builder, created): builder.PrependUint64Slot(1, created, 0)
def UserKeyAddOwner(builder, owner): builder.PrependUOffsetTRelativeSlot(2, flatbuffers.number_types.UOffsetTFlags.py_type(owner), 0)
def UserKeyStartOwnerVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def UserKeyAddWalletAddress(builder, walletAddress): builder.PrependUOffsetTRelativeSlot(3, flatbuffers.number_types.UOffsetTFlags.py_type(walletAddress), 0)
def UserKeyStartWalletAddressVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def UserKeyAddSignature(builder, signature): builder.PrependUOffsetTRelativeSlot(4, flatbuffers.number_types.UOffsetTFlags.py_type(signature), 0)
def UserKeyStartSignatureVector(builder, numElems): return builder.StartVector(1, numElems, 1)
def UserKeyEnd(builder): return builder.EndObject()