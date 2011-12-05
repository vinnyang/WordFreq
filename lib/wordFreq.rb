freqz = Hash.new(0)
sentences4word = Hash.new{|sentences, word| sentences[word] = []}
# use these two hashes to keep track of the indexes

sentences = File.open('sample_text.txt'){|f| f.read}.split(/\. |\?|\!/) # split the text into sentences
sentences.each do |s| 
  words = s.split(/\W|\s/) # and split each sentence by words
  words.each do |w|
    freqz[w] += 1 # frequency plus one every time the word shows up
    sentences4word[w] << sentences.index(s) + 1
  end
end

freqz = freqz.sort_by { |w,f| f }.reverse! # sort the list
freqz.each do |w, f|
  puts w + ' ' + f.to_s + ' ' + sentences4word[w].uniq.to_s # put everything together
end
