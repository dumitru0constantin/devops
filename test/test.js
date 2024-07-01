const assert = require('assert');
const { describe, it } = require('mocha');

// Sample function to test
function add(a, b) {
  return a + b;
}

// Mocha test suite
describe('Math operations', function() {
  
  // Test case
  it('should correctly add two numbers', function() {
    const result = add(2, 3);
    assert.strictEqual(result, 5);
  });

  
});
