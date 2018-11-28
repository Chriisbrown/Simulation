#include "TFile.h"
#include "TH1F.h"
#include "TTreeReader.h"
#include "TTreeReaderValue.h"
#include <fstream>
using namespace std; 

void tchain(char k=0, char j=0)
{	
	TString s = std::to_string(k);
	TChain chain("1");
	
	if (j == 1) {
		chain.Add("data.root");
	}
	if (j > 1) {
		for ( int x = 0; x < j; x++ ) {
			TString y = std::to_string(x);
			chain.Add("data_t" + y + ".root");
		}
	}
	
	TFile *file = TFile::Open(s+"out.root","RECREATE"); 
	chain.CloneTree(-1,"fast"); 
	file->Write(); 
	delete file;
}
