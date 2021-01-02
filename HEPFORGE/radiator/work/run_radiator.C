void run_radiator()
{
  gSystem->AddIncludePath("-D__USE_XOPEN2K8");
  gROOT->ProcessLine(".L Radiator_v2.C+");
  radiator("radiator.txt","Radiator.root");
}
