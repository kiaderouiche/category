# automatically generated by the FlatBuffers compiler, do not modify

# namespace: mrealm

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

class WebCluster(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAsWebCluster(cls, buf, offset):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = WebCluster()
        x.Init(buf, n + offset)
        return x

    # WebCluster
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # ID of this object.
    # WebCluster
    def Oid(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            x = o + self._tab.Pos
            from ..oid_t import oid_t
            obj = oid_t()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # Label for this object (not interpreted by CFC).
    # WebCluster
    def Label(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # Description for this object (not interpreted by CFC).
    # WebCluster
    def Description(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(8))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # Tags on this object.
    # WebCluster
    def Tags(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.String(a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 4))
        return ""

    # WebCluster
    def TagsLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # WebCluster
    def TagsIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(10))
        return o == 0

    # Unique user assigned name.
    # WebCluster
    def Name(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(12))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # Current status of web cluster.
    # WebCluster
    def Status(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(14))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint8Flags, o + self._tab.Pos)
        return 0

    # IP version, either 4 for 6
    # WebCluster
    def TcpVersion(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(16))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int8Flags, o + self._tab.Pos)
        return 0

    # IP listening port
    # WebCluster
    def TcpPort(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(18))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint16Flags, o + self._tab.Pos)
        return 0

    # enable TCP port sharing
    # WebCluster
    def TcpShared(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(20))
        if o != 0:
            return bool(self._tab.Get(flatbuffers.number_types.BoolFlags, o + self._tab.Pos))
        return False

    # listen on this interface
    # WebCluster
    def TcpInterface(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(22))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # TCP accept backlog queue size
    # WebCluster
    def TcpBacklog(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(24))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # TLS server private key to use
    # WebCluster
    def TlsKey(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(26))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # TLS server certificate to use
    # WebCluster
    def TlsCertificate(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(28))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # TLS certificate chain
    # WebCluster
    def TlsChainCertificates(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(30))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.String(a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 4))
        return ""

    # WebCluster
    def TlsChainCertificatesLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(30))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # WebCluster
    def TlsChainCertificatesIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(30))
        return o == 0

    # CA certificates to use
    # WebCluster
    def TlsCaCertificates(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(32))
        if o != 0:
            a = self._tab.Vector(o)
            return self._tab.String(a + flatbuffers.number_types.UOffsetTFlags.py_type(j * 4))
        return ""

    # WebCluster
    def TlsCaCertificatesLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(32))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # WebCluster
    def TlsCaCertificatesIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(32))
        return o == 0

    # DH parameter file
    # WebCluster
    def TlsCiphers(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(34))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # Ciphers list
    # WebCluster
    def TlsDhparam(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(36))
        if o != 0:
            return self._tab.String(o + self._tab.Pos)
        return None

    # HTTP client inactivity timeout
    # WebCluster
    def HttpClientTimeout(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(38))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # enable HTTP strict transport security (HSTS)
    # WebCluster
    def HttpHsts(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(40))
        if o != 0:
            return bool(self._tab.Get(flatbuffers.number_types.BoolFlags, o + self._tab.Pos))
        return False

    # HSTS maximum age to announce
    # WebCluster
    def HttpHstsMaxAge(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(42))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Int32Flags, o + self._tab.Pos)
        return 0

    # enable Web request access logging
    # WebCluster
    def HttpAccessLog(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(44))
        if o != 0:
            return bool(self._tab.Get(flatbuffers.number_types.BoolFlags, o + self._tab.Pos))
        return False

    # enable tracebacks when running into Web errors
    # WebCluster
    def HttpDisplayTracebacks(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(46))
        if o != 0:
            return bool(self._tab.Get(flatbuffers.number_types.BoolFlags, o + self._tab.Pos))
        return False

def WebClusterStart(builder): builder.StartObject(22)
def WebClusterAddOid(builder, oid): builder.PrependStructSlot(0, flatbuffers.number_types.UOffsetTFlags.py_type(oid), 0)
def WebClusterAddLabel(builder, label): builder.PrependUOffsetTRelativeSlot(1, flatbuffers.number_types.UOffsetTFlags.py_type(label), 0)
def WebClusterAddDescription(builder, description): builder.PrependUOffsetTRelativeSlot(2, flatbuffers.number_types.UOffsetTFlags.py_type(description), 0)
def WebClusterAddTags(builder, tags): builder.PrependUOffsetTRelativeSlot(3, flatbuffers.number_types.UOffsetTFlags.py_type(tags), 0)
def WebClusterStartTagsVector(builder, numElems): return builder.StartVector(4, numElems, 4)
def WebClusterAddName(builder, name): builder.PrependUOffsetTRelativeSlot(4, flatbuffers.number_types.UOffsetTFlags.py_type(name), 0)
def WebClusterAddStatus(builder, status): builder.PrependUint8Slot(5, status, 0)
def WebClusterAddTcpVersion(builder, tcpVersion): builder.PrependInt8Slot(6, tcpVersion, 0)
def WebClusterAddTcpPort(builder, tcpPort): builder.PrependUint16Slot(7, tcpPort, 0)
def WebClusterAddTcpShared(builder, tcpShared): builder.PrependBoolSlot(8, tcpShared, 0)
def WebClusterAddTcpInterface(builder, tcpInterface): builder.PrependUOffsetTRelativeSlot(9, flatbuffers.number_types.UOffsetTFlags.py_type(tcpInterface), 0)
def WebClusterAddTcpBacklog(builder, tcpBacklog): builder.PrependInt32Slot(10, tcpBacklog, 0)
def WebClusterAddTlsKey(builder, tlsKey): builder.PrependUOffsetTRelativeSlot(11, flatbuffers.number_types.UOffsetTFlags.py_type(tlsKey), 0)
def WebClusterAddTlsCertificate(builder, tlsCertificate): builder.PrependUOffsetTRelativeSlot(12, flatbuffers.number_types.UOffsetTFlags.py_type(tlsCertificate), 0)
def WebClusterAddTlsChainCertificates(builder, tlsChainCertificates): builder.PrependUOffsetTRelativeSlot(13, flatbuffers.number_types.UOffsetTFlags.py_type(tlsChainCertificates), 0)
def WebClusterStartTlsChainCertificatesVector(builder, numElems): return builder.StartVector(4, numElems, 4)
def WebClusterAddTlsCaCertificates(builder, tlsCaCertificates): builder.PrependUOffsetTRelativeSlot(14, flatbuffers.number_types.UOffsetTFlags.py_type(tlsCaCertificates), 0)
def WebClusterStartTlsCaCertificatesVector(builder, numElems): return builder.StartVector(4, numElems, 4)
def WebClusterAddTlsCiphers(builder, tlsCiphers): builder.PrependUOffsetTRelativeSlot(15, flatbuffers.number_types.UOffsetTFlags.py_type(tlsCiphers), 0)
def WebClusterAddTlsDhparam(builder, tlsDhparam): builder.PrependUOffsetTRelativeSlot(16, flatbuffers.number_types.UOffsetTFlags.py_type(tlsDhparam), 0)
def WebClusterAddHttpClientTimeout(builder, httpClientTimeout): builder.PrependInt32Slot(17, httpClientTimeout, 0)
def WebClusterAddHttpHsts(builder, httpHsts): builder.PrependBoolSlot(18, httpHsts, 0)
def WebClusterAddHttpHstsMaxAge(builder, httpHstsMaxAge): builder.PrependInt32Slot(19, httpHstsMaxAge, 0)
def WebClusterAddHttpAccessLog(builder, httpAccessLog): builder.PrependBoolSlot(20, httpAccessLog, 0)
def WebClusterAddHttpDisplayTracebacks(builder, httpDisplayTracebacks): builder.PrependBoolSlot(21, httpDisplayTracebacks, 0)
def WebClusterEnd(builder): return builder.EndObject()