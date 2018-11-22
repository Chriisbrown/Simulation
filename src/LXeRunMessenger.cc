#include "LXeRunMessenger.hh"
#include "LXeRunAction.hh"

#include "G4UIcmdWithAnInteger.hh"
#include "G4UIcommand.hh"
#include "G4UIdirectory.hh"

LXeRunMessenger::LXeRunMessenger(LXeRunAction* run)
 : fLXeRun(run)
{
  fRootNameDir = new G4UIdirectory("/LXe/rootname/");
  fRootNameDir->SetGuidance("Change Name of ROOT Output File");

  fRootNameCmd = new G4UIcmdWithAnInteger("/LXe/rootname/number",this);
  fRootNameCmd->SetGuidance("Set the iteration number of the ROOT output file.");

  fLXeRun->SetRootName(1);
}


LXeRunMessenger::~LXeRunMessenger()
{
  delete fRootNameCmd;
}


void LXeRunMessenger::SetNewValue(G4UIcommand* command, G4String newValue)
{
  if (command == fRootNameCmd){
    fLXeRun->SetRootName(fRootNameCmd->GetNewIntValue(newValue));
  }

    //G4RunManager::GetRunManager()->ReinitializeGeometry();
}
