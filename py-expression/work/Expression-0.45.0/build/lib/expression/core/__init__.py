"""
Core abstractions such as pipes, options and results.
"""

from . import aiotools, option, result
from .builder import Builder
from .choice import Choice, Choice1of2, Choice1of3, Choice2, Choice2of2, Choice2of3, Choice3, Choice3of3
from .compose import compose
from .curry import curried
from .error import EffectError, failwith
from .fn import TailCall, TailCallResult, tailrec, tailrec_async
from .mailbox import AsyncReplyChannel, MailboxProcessor
from .match import Case, MatchMixin, match
from .misc import flip, fst, identity, snd
from .option import Nothing, Nothing_, Option, Some
from .pipe import pipe, pipe2, pipe3
from .result import Error, Ok, Result
from .try_ import Failure, Success, Try
from .typing import SupportsLessThan, SupportsMatch

__all__ = [
    "aiotools",
    "AsyncReplyChannel",
    "Builder",
    "Case",
    "Choice",
    "Choice2",
    "Choice3",
    "Choice1of2",
    "Choice2of2",
    "Choice1of3",
    "Choice2of3",
    "Choice3of3",
    "compose",
    "curried",
    "MatchMixin",
    "EffectError",
    "Error",
    "Failure",
    "failwith",
    "flip",
    "fst",
    "identity",
    "MailboxProcessor",
    "match",
    "Nothing",
    "Nothing_",
    "Ok",
    "Option",
    "option",
    "pipe",
    "pipe2",
    "pipe3",
    "result",
    "Result",
    "snd",
    "Some",
    "Success",
    "SupportsLessThan",
    "SupportsMatch",
    "TailCall",
    "TailCallResult",
    "tailrec",
    "tailrec_async",
    "Try",
]
