program PGrid;

uses
  Forms,
  UGrid in 'UGrid.pas' {Gridform};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGridform, Gridform);
  Application.Run;
end.
