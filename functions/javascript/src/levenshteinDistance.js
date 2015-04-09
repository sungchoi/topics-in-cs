var buildPseudoMatrixForLevenshteinDistanceFunction = function buildPseudoMatrixForLevenshteinDistanceFunction(wordOneLength, wordTwoLength) {
  var matrix = [];

  for (var i = 0; i < wordTwoLength + 1; i++) {
    matrix.push([i]);
  }

  for (var i = 1; i < wordOneLength + 1; i++) {
    matrix[0].push(i);
  }

  return matrix;
};

var levenshteinDistance = function(word1, word2){
  var matrix = buildPseudoMatrixForLevenshteinDistanceFunction(word1.length, word2.length);

  for (var i = 1; i < word2.length + 1; i++) {
    for (var j = 1; j < word1.length + 1; j++) {
      var distance = Math.min(matrix[i - 1][j - 1], matrix[i][j - 1], matrix[i - 1][j])
      if (word2[i - 1] != word1[j - 1]) {
        distance += 1;
      }

      matrix[i][j] = distance;
    }
  }

  return matrix[word2.length][word1.length];
};
