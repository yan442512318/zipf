"""`
Count the occurrence of all words in a text
and output the in csv format.
"""

import argparse

import csv
from pydoc import describe
import sys

import string
from collections import Counter
from wsgiref.simple_server import demo_app

import utilities as util

def main(args):
  """Run the command line program."""
  word_counts = count_words(args.infile)
  util.collect_to_csv(word_counts, num=args.num)


def count_words(reader):
  """Counter the occurence of each word in a string."""
  text = reader.read()
  chunks = text.split()
  npunc = [word.strip(string.punctuation) for word in chunks]
  word_list = [word.lower() for word in npunc if word]
  word_counts = Counter(word_list)
  return word_counts


if __name__ == '__main__':

  parser = argparse.ArgumentParser(description=__doc__)
  parser.add_argument('infile', type=argparse.FileType('r'), nargs='?', default='-', help='Input file name')
  parser.add_argument('-n', '--num', type=int, default=None, help='Output n most frequent words')
  args = parser.parse_args()
  main(args)
