#!/usr/bin/env ruby

def pyramid_sum(base)
  pyramid = [base]
  build_pyramid(pyramid) while pyramid.length < base.length
  pyramid
end

def build_pyramid(arr)
  cur_level = arr[0]
  new_level = []
  cur_level.each.with_index do |elem, i|
    unless cur_level[i] == cur_level[-1]
      sum = cur_level[i] + cur_level[i + 1]
      new_level << sum
    end
  end
  arr.unshift(new_level)
  arr
end

if $PROGRAM_NAME == __FILE__
  p pyramid_sum([3, 7, 2, 11])
end
