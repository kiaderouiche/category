# Copyright 2014-2017 Insight Software Consortium.
# Copyright 2004-2009 Roman Yakovenko.
# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

import unittest

from . import parser_test_case

from pygccxml import parser
from pygccxml import declarations


class Test(parser_test_case.parser_test_case_t):

    def __init__(self, *args):
        parser_test_case.parser_test_case_t.__init__(self, *args)
        self.header = "null_comparison.hpp"

    def test_argument_null_comparison(self):
        """
        Test for None comparisons with default arguments
        """

        decls = parser.parse([self.header], self.config)
        global_ns = declarations.get_global_namespace(decls)

        ns = global_ns.namespace("ns")

        func = ns.free_function(name="TestFunction1")
        assert (func.arguments[0] > func.arguments[1]) is False

        func = ns.free_function(name="TestFunction2")
        assert (func.arguments[0] > func.arguments[1]) is False


def create_suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(Test))
    return suite


def run_suite():
    unittest.TextTestRunner(verbosity=2).run(create_suite())


if __name__ == "__main__":
    run_suite()
