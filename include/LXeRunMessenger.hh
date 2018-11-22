#ifndef LXeRunMessenger_h
#define LXeRunMessenger_h 1

#include "G4UImessenger.hh"
#include "globals.hh"

class LXeRunAction;
class G4UIdirectory;
class G4UIcmdWithADoubleAndUnit;
class G4UIcmdWith3VectorAndUnit;
class G4UIcmdWithAnInteger;
class G4UIcommand;
class G4UIcmdWithABool;
class G4UIcmdWithADouble;

class LXeRunMessenger: public G4UImessenger
{
  public:

    LXeRunMessenger(LXeRunAction* run);
    ~LXeRunMessenger();

    void SetNewValue(G4UIcommand* command, G4String newValue);

  private:

    LXeRunAction*     fLXeRun;
    G4UIdirectory*    fRootNameDir;
    G4UIcmdWithAnInteger*        fRootNameCmd;

};

#endif
