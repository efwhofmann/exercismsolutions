/* These implementation definitions enable zero-argument contructors:
 *    throw EmptyBufferException();
 */

class EmptyBufferException implements Exception {}

class FullBufferException implements Exception {}

class CircularBuffer {
  late int size;
  late List<int?> cBuffer;
  int oldest = 0;
  int newest = 0;
  int nElems = 0;

  CircularBuffer(this.size){
    cBuffer = List<int?>.filled(size, null);
  }

  void write(int val, {bool force=false}){    
    if(!force || nElems < size){
      if(nElems>=size)
        throw FullBufferException();
      cBuffer[newest] = val;
      nElems++;
      newest = (newest + 1) % size;
    } else {
      cBuffer[oldest] = val;
      oldest = (oldest + 1) % size;
    }
  }

  int read(){
    if(cBuffer.isEmpty || nElems ==0)
      throw EmptyBufferException();
    int? val = cBuffer[oldest];
    if(val==null)
      throw EmptyBufferException();
    int res = val!;
    cBuffer[oldest] = null;
    oldest = (oldest + 1) % size;
    nElems--;
    return res;
  }

  void clear(){
    cBuffer = List<int?>.filled(size, null);
    newest = 0;
    oldest = 0;
    nElems = 0;
  }
}
