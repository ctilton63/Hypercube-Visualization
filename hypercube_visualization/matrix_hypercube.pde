
float[][] vecToMatrix(P4Vector v){
  float[][] a = new float[4][1];
  a[0][0] =v.x;
  a[1][0]=v.y;
  a[2][0]=v.z;
  a[3][0]=v.w;
  return a;
}

PVector matrixToVec(float[][] a){
  PVector v = new PVector();
  v.x = a[0][0];
  v.y = a[1][0];
  v.z = a[2][0];
  return v;
}

P4Vector matrixToVec4(float[][] a ){
  P4Vector v = new P4Vector(0, 0, 0, 0);
  v.x = a[0][0];
  v.y = a[1][0];
  v.z = a[2][0];
  v.w = a[3][0];
  return v;
}

void logMatrix (float[][] a){
  int cols = a[0].length;
  int rows = a.length;
  println(rows + "x" + cols);
  println("----------------");
  for(int i = 0; i<rows; i ++){
    for(int j = 0; j<cols; j++){
      print(a[i][j] + " ");
    }
    println();
  }
  println();
}

PVector matmul(float[][] a, P4Vector b){
  float [][] m = vecToMatrix(b);
  return matrixToVec(matmul(a,m));
  
}

P4Vector matmul(float[][] a, P4Vector b, boolean fourth){
  float[][] m = vecToMatrix(b);
  return matrixToVec4(matmul(a,m));
}

float[][] matmul(float[][] a, float[][] b){
  int colsA = a[0].length;
  int rowsA = a.length;
  int colsB = b[0].length;
  int rowsB = b.length;
  if(colsA != rowsB){
     println("Columns of A must match rows of B");
     return null;
  }
  float result[][] = new float[rowsA][colsB];
  
  for(int i =0; i<rowsA; i++){
    for(int j = 0; j< colsB; j++){
      float sum = 0;
      for(int k = 0; k<colsA; k++){
        sum += a[i][k]*b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}
