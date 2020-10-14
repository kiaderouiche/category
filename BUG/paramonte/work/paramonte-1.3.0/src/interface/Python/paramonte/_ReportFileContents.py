####################################################################################################################################
####################################################################################################################################
####
####   MIT License
####
####   ParaMonte: plain powerful parallel Monte Carlo library.
####
####   Copyright (C) 2012-present, The Computational Data Science Lab
####
####   This file is part of the ParaMonte library.
####
####   Permission is hereby granted, free of charge, to any person obtaining a 
####   copy of this software and associated documentation files (the "Software"), 
####   to deal in the Software without restriction, including without limitation 
####   the rights to use, copy, modify, merge, publish, distribute, sublicense, 
####   and/or sell copies of the Software, and to permit persons to whom the 
####   Software is furnished to do so, subject to the following conditions:
####
####   The above copyright notice and this permission notice shall be 
####   included in all copies or substantial portions of the Software.
####
####   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
####   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
####   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
####   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
####   DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
####   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
####   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
####
####   ACKNOWLEDGMENT
####
####   ParaMonte is an honor-ware and its currency is acknowledgment and citations.
####   As per the ParaMonte library license agreement terms, if you use any parts of 
####   this library for any purposes, kindly acknowledge the use of ParaMonte in your 
####   work (education/research/industry/development/...) by citing the ParaMonte 
####   library as described on this page:
####
####       https://github.com/cdslaborg/paramonte/blob/master/ACKNOWLEDGMENT.md
####
####################################################################################################################################
####################################################################################################################################

import numpy as np
import _paramonte as pm
from _OutputFileContents import OutputFileContents

Struct = pm.Struct
newline = pm.newline
creturn = pm.creturn

class StructWithPrint:
    def __init__(self): self.value = None
    def print(self): print(self.value)

####################################################################################################################################
#### ReportFileContents
####################################################################################################################################

class ReportFileContents(OutputFileContents):
    """

    This is the **ReportFileContents** class for generating instances
    of the ParaMonte output report file contents. This class is NOT meant 
    to be directly accessed by the ParaMonte library users. It is internally
    used by the ParaMonte library to parse the contents of the output Report
    files generated by the ParaMonte sampler routines. For example, the ParaDRAM
    sampler class makes calls to this class via its ``readReport()`` method to
    return a list of objects of class ``ReportFileContents``.

        **Parameters**

            file

                The full path to the file containing the report.

            methodName

                A string representing the name of the ParaMonte sampler used
                to call the constructor of the ``ReportFileContents`` class.

            reportEnabled

                A logical input parameter indicating whether the ParaMonte
                automatic guidelines to the standard output should be provided 
                or not. The default value is ``True``.

        **Attributes**

            A dynamic set of attributes that are directly parsed from the file.

        **Returns**

            ReportFileContents

                An object of class ``ReportFileContents``.

    ----------------------------------------------------------------------
    """

    ################################################################################################################################
    #### __init__
    ################################################################################################################################

    def __init__( self
                , file
                , methodName
                , reportEnabled
                ):

        super().__init__(file, methodName, reportEnabled)

        # set the hidden variables

        self._lineListLen = []
        self._indentLen = 8  # indent length of the records
        self._dsym = "****"  # decoration symbol
        self._lineCounter = 0
        self._prefix = Struct()
        self._dsymLen = len(self._dsym)
        self._prefix.note = self._methodName + " - NOTE: "
        self._prefix.warn = self._methodName + " - WARNING: "
        self.contents = StructWithPrint()

        with open(self.file,"r") as fid: self.contents.value = fid.read().replace(creturn,"").replace(newline, " " + newline)
        self._lineList = self.contents.value.splitlines()
        self._lineListLen = len(self._lineList)

        self._progress.note( msg = "parsing the report file contents...", end = newline, pre = True )

        self._lineCounter  = -1

        ############################################################################################################################
        #### define the components
        ############################################################################################################################

        self.setup = Struct()
        self.setup.library = Struct()
        self.setup.library.banner = StructWithPrint()
        self.setup.library.interface = StructWithPrint()
        self.setup.platform = StructWithPrint()
        self.setup.io = StructWithPrint()
        self.spec = StructWithPrint()

        ############################################################################################################################
        #### read the banner
        ############################################################################################################################

        lineStartFound = False
        lineStart = 0
        while True:
            self._lineCounter += 1
            if self._lineCounter>=self._lineListLen: break
            if lineStartFound:
                if self._dsym not in self._lineList[self._lineCounter]:
                    self._lineCounter -= 1
                    break
            else:
                if self._dsym in self._lineList[self._lineCounter]:
                    lineStart = self._lineCounter
                    lineStartFound = True

        self.setup.library.banner.description = "This is the ParaMonte banner appearing at the beginning of each file."
        if lineStartFound:
            self.setup.library.banner.value = self._concat(lineStart,self._lineCounter)
        else:
            self._reportParseFailure("ParaMonte banner")

        ############################################################################################################################
        #### read the ParaMonte library interface specifications
        ############################################################################################################################

        self.setup.library.interface.description = "This is the interface to the ParaMonte library that has been used to generate this report file."
        self.setup.library.interface.value = self._parseSection("ParaMonte library interface specifications")

        ############################################################################################################################
        #### read the Runtime platform specifications
        ############################################################################################################################

        self.setup.platform.description = "Information about the runtime platform specifications"
        self.setup.platform.value = self._parseSection("Runtime platform specifications")

        ############################################################################################################################
        #### read the simulation environment
        ############################################################################################################################

        self.setup.io.description = "Information about the simulation input and output files."
        self.setup.io.value = self._parseSection("simulation environment")

        ############################################################################################################################
        #### read the simulation specifications
        ############################################################################################################################

        self.spec.description = "Information about all input simulation specifications."
        self.spec.value = self._parseSection("simulation specifications").replace(self._prefix.note,"").replace(self._prefix.warn,"")

        ############################################################################################################################
        #### statistics: this must be always the last item to parse
        ############################################################################################################################

        self._parseStats()

        ############################################################################################################################

        self._progress.note()

    ################################################################################################################################
    #### _reportParseFailure
    ################################################################################################################################

    def _reportParseFailure(self,topic):
        topic = topic.replace(newline," ").replace(creturn," ").strip()
        pm.warn ( msg   = "Failed to parse the record \"" + topic + "\". "
                        + "The structure of the report file appears to have been compromised. skipping... "
                        , methodName = self._methodName
                        , marginTop = 0
                        , marginBot = 0
                        )

    ################################################################################################################################
    #### _reportMissingValue
    ################################################################################################################################

    def _reportMissingValue(self,topic):
        topic = topic.replace(newline," ").replace(creturn," ").strip()
        pm.warn ( msg   = "Failed to parse the value corresponding to the record \"" + topic + "\". "
                        + "The structure of the report file appears to have been compromised. skipping... "
                        , methodName = self._methodName
                        , marginTop = 0
                        , marginBot = 0
                        )

    ################################################################################################################################
    #### _isSectionHeader
    ################################################################################################################################

    def _isSectionHeader(self,record): return True if len(record)>self._dsymLen and self._dsym in record[0:self._dsymLen] else False

    ################################################################################################################################
    #### _stopBeforeNextSectionHeader
    ################################################################################################################################

    def _stopBeforeNextSectionHeader(self):
        # NOTE: if it is already within a section header, it will skip it and find the next section header.
        record = self._lineList[self._lineCounter]
        isCurrentSectionHeader = len(record)>self._dsymLen and self._dsym in record[0:self._dsymLen+1]
        while True:
            if self._lineCounter==self._lineListLen: break
            record = self._lineList[self._lineCounter]
            if len(record)>self._dsymLen and self._dsym in record[0:self._dsymLen]:
                if isCurrentSectionHeader:
                    self._lineCounter += 1
                    continue
                else:
                    self._lineCounter -= 1
                    break
            else:
                isCurrentSectionHeader = False
                self._lineCounter += 1
                continue

    ################################################################################################################################
    #### _skipCurrentSectionHeader
    ################################################################################################################################

    def _skipCurrentSectionHeader(self):
        while True:
            record = self._lineList[self._lineCounter]
            if len(record)>self._dsymLen and self._dsym in record[0:self._dsymLen]:
                self._lineCounter += 1
                if self._lineCounter==self._lineListLen: break
                continue
            else:
                break

    ################################################################################################################################
    #### _parseSection
    ################################################################################################################################

    def _parseSection(self,topic):
        lineCounterLastSuccess = self._lineCounter
        section = []
        topicFound = False
        while True:
            self._lineCounter += 1
            if self._lineCounter>=self._lineListLen: break
            record = self._lineList[self._lineCounter]
            if topic in record:
                topicFound = True
                break
            else:
                continue

        if topicFound:
            self._skipCurrentSectionHeader()
            lineStart = self._lineCounter
            self._stopBeforeNextSectionHeader()
            section = self._concat(lineStart, self._lineCounter)
        else:
            self._reportParseFailure(topic)
            self._lineCounter = lineCounterLastSuccess

        return section

    ################################################################################################################################
    #### _concat
    ################################################################################################################################

    def _concat(self,lineStart,lineCounter): return newline.join(self._lineList[lineStart:lineCounter+1])

    ################################################################################################################################
    #### _parseStats
    ################################################################################################################################

    def _parseStats(self):

        self.stats = Struct()
        if self._methodName=="ParaDRAM" or self._methodName=="ParaDISE" or self._methodName=="MatDRAM":

            while True:

                self._lineCounter += 1
                if self._lineCounter>=self._lineListLen: break
                item = self._lineList[self._lineCounter]

                if self._isstats(item):

                    ################################################################################################################
                    #### parse the value
                    ################################################################################################################


                    valueIsNumeric = True
                    valueFound = False
                    descFound = False
                    value = ""
                    desc = ""

                    ################################################################################################################

                    while True:

                        self._lineCounter += 1
                        if self._lineCounter>=self._lineListLen: break
                        record = self._lineList[self._lineCounter].replace(newline," ").replace(creturn," ")

                        #### check the record is not another item or desc is not found before value.

                        if self._isstats(record): # and not (descFound and valueFound)
                            self._lineCounter -= 1
                            break

                        #### parse the value/description

                        if len(record)>self._indentLen:
                            recordIsDesc = self._isdesc(record)
                            if recordIsDesc:
                                if not valueFound:
                                    self._reportMissingValue(item)
                                    break
                                descFound = True
                                desc += " " + self._lineList[self._lineCounter].replace(self._prefix.note," ").replace(self._prefix.warn," ").strip() # remove prefix, trim, append.
                            elif not descFound:
                                valueFound = True
                                value += record
                                try:
                                    _ = [ np.double(element) for element in record.split() ] # numericValue
                                except:
                                    valueIsNumeric = False


                    ################################################################################################################

                    if valueFound and descFound:
                        componentList = item.split(".")
                        currentComponentName = "self"
                        for component in componentList:
                            propExists = eval( "hasattr(" + currentComponentName + ",'" + component + "')" )
                            if not propExists:
                                exec(currentComponentName+"."+component+"=Struct()")
                            currentComponentName += "." + component
                        if valueIsNumeric and "infinity" not in value.lower():
                            value = value.split()
                            value = value[0] if len(value)==1 else "[" + ",".join(value) + "]" # make vector of values
                        else:
                            value = "r'" + value + "'"
                            exec(currentComponentName + "=StructWithPrint()")
                        exec( currentComponentName + ".value=" + value )
                        exec( currentComponentName + ".description=r'" + desc.strip() + "'" )

    ################################################################################################################################
    #### _isstats
    ################################################################################################################################

    def _isstats(self,record): return len(record)>5 and record[0:6]=="stats."

    ################################################################################################################################
    #### _isstats
    ################################################################################################################################

    def _isdesc(self,record): return self._prefix.note in record or self._prefix.warn in record
