#include "TFile.h"
#include "TH1F.h"
#include "TTreeReader.h"
#include "TTreeReaderValue.h"
#include <iostream>
#include <fstream>
#include <string>
using namespace std; 

void tfriends(char k=0)
{	
	FILE *fp = fopen("positions.txt","r");
	Float_t a,b;
	Int_t ncols;

	for ( int x = 1; x < k+1; x++ ) {
		ncols = fscanf(fp,"%f %f",&a,&b);
		printf("a=%4f, b=%4f\n", a,b);
		
		TString s = std::to_string(x);
		TString h = std::to_string(a);
		TString g = std::to_string(b);
		
		TFile *oldfile = new TFile(s+"out.root");
		TTree *oldtree = (TTree*)oldfile->Get("1");
		oldtree->SetName(h+","+g);
		TFile *newfile = new TFile("full.root","update");
		TTree *newtree = oldtree->CloneTree();
		newtree->Print();
		newfile->Write();
		delete oldfile;
		delete newfile;
	}
			
}