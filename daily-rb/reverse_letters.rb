def reverse_it(str)
  i = 0
  j = str.length - 1
  while i < j
    i = letter?(str[i]) ? i : i + 1
    j = letter?(str[j]) ? j : j - 1
    str[i], str[j] = str[j], str[i]
    i += 1
    j -= 1
  end
  str
end

def letter?(char)
  /[a-z]/i.match?(char)
end

if $PROGRAM_NAME == __FILE__
  p reverse_it('h-el-lo')
  p reverse_it('ab-cd')
  p reverse_it('a-bC-dEf-ghIj')
  p reverse_it('Test1ng-Leet=code-Q!')
end
