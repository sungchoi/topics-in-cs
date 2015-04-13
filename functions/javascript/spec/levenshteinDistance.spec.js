var chai = require('chai');
var expect = chai.expect;

var levenshteinDistance = require('../src/levenshteinDistance.js');

describe('levenshteinDistance', function(){
  it('should return an edit distance of 0 when the words are the same', function(){
    var editDistance = levenshteinDistance('python', 'python')
    expect(editDistance).to.equal(0);
  });

  it('should calculate the correct distance when only character additions are required', function(){
    var editDistance = levenshteinDistance('java', 'javascript')
    expect(editDistance).to.equal(6);
  });

  it('should calculate the correct distance when only character deletions are required', function(){
    var editDistance = levenshteinDistance('golang', 'go')
    expect(editDistance).to.equal(4);
  });

  it('should calculate the correct distance when only character substitutions are required', function(){
    var editDistance = levenshteinDistance('swift','scala');
    expect(editDistance).to.equal(4);
  });

  it('should calculate the correct distance when input words share no letters in common', function(){
    var editDistance = levenshteinDistance('ruby','lisp');
    expect(editDistance).to.equal(4);
  });

  it('should calculate the correct distance when any numequalr of edits are required', function(){
    var editDistance = levenshteinDistance('haskell', 'chicken');
    expect(editDistance).to.equal(5);

    editDistance = levenshteinDistance('clojure', 'rust');
    expect(editDistance).to.equal(6);

    editDistance = levenshteinDistance('c', 'whitespace');
    expect(editDistance).to.equal(9);

    editDistance = levenshteinDistance('sql', 'squirrel');
    expect(editDistance).to.equal(5);

    editDistance = levenshteinDistance('elm', 'erlang');
    expect(editDistance).to.equal(4);
  });
});

