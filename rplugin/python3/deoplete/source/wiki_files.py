from deoplete.base.source import Base
from deoplete.util import Nvim, UserContext, Candidates

import os
import glob


class Source(Base):

  def __init__(self, vim: Nvim) -> None:

    super().__init__(vim)


    self.name = 'wiki_files'
    self.mark = '[WL]'
    self.min_pattern_length = 0
    self.rank = 300
    # only activate for files in my notes directory
    self.filetypes = ['zettel']


  def get_complete_position(self, context: UserContext) -> int:
    # trigger completion if we're currently in the [[link]] syntax
    pos = context['input'].rfind('[[')
    return pos if pos < 0 else pos + 2


  def gather_candidates(self, context: UserContext) -> Candidates:
    candidates: Candidates = []
    path = os.path.expanduser('~/wiki')
    # gather all note files, and return paths relative to the current
    # note's directory
    cur_file_dir = os.path.dirname(self.vim.buffers[context['bufnr']].name)
    for fname in glob.iglob(path + '**/*', recursive=True):
      fname = os.path.relpath(fname, cur_file_dir)
      if fname.endswith('.md'):
        fname = fname[:-3]
        candidates.append(fname)
    return candidates

