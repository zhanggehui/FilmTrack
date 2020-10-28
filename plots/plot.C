{
  gROOT->Reset();

  TFile f1("FilmTrack.root");

  TCanvas* c1 = new TCanvas("c1", " ");
  c1->SetLogy(1); c1->SetLogx(1);
  c1->cd(); c1->Update();

  TH1D* hist = (TH1D*)f1.Get("h2");
  hist->Draw("HIST C");
}  
