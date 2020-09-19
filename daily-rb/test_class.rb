require 'set'
class WordChainer
    attr_reader :dictionary

    def initialize(dictionary_file_name)
        @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
        @dictionary = Set.new(@dictionary)
    end

    def run(source, target)
        @current_words = [source]
        all_seen_words = [source]

        # halts exploration when all words adjacent to @current_word have been discovered
        # until @all_seen_words.empty?
        #     # fill with new words (not in @all_seen_words) that are adjacent to word in @current_words
        #     new_current_words = []
        #     @current_words.each do |current_word|
        #         adjacent_words(current_word).each do |adjacent_word|
        #             next if @all_seen_words.include?(adjacent_word)
        #             new_current_words << adjacent_word
        #             @all_seen_words << adjacent_word
        #         end
        #     end
        #     p new_current_words
        #     @current_words = new_current_words
        # end
        p @current_words
    end

    def adjacent_words(word)
        adjacent_words = []
        word.each_char.with_index do |old_letter, i|
            ("a".."z").each do |new_letter|
                next if old_letter == new_letter
                new_word = word.dup
                new_word[i] = new_letter

                adjacent_words << new_word if dictionary.include?(new_word)
            end
        end
        adjacent_words
    end
	
end


# chain = WordChainer.new('./dictionary.txt')
# chain.run_it('duck', 'ruby')
