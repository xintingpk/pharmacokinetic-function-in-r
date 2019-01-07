# Define a AUC function to calculate AUCtau
# Requires package Rcpp
cppFunction('double f_auc(NumericVector t, NumericVector c) {
            int length = t.size();
            NumericVector AucSection(length - 1);
            double total = 0;
            for(int i=0; i < length-1; ++i){
            AucSection[i] = (t[i+1] - t[i]) * (c[i+1] + c[i]) / 2;
            }
            
            for(int j = 0; j < length - 1; ++j){
            total += AucSection[j];
            }
            
            return total;
            }')
