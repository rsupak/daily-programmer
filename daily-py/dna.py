def find_dna_compliment(dna):
    strand_pairs = {'A':'T', 
                    'T':'A', 
                    'G':'C', 
                    'C':'G'}
                    
    new_strand = ""
    for letter in dna:
         new_strand += strand_pairs[letter]

    return new_strand

x = find_dna_compliment('GATTACA')

print(x)