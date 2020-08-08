program LeitorDeHint;

uses
  Vcl.Forms,
  uFrmLerFileHint in 'uFrmLerFileHint.pas' {FrmLerFileHint},
  uFrmLerFileHint.Service in 'uFrmLerFileHint.Service.pas',
  uFileHint in 'uFileHint.pas',
  u.Oo.Hint in 'u.Oo.Hint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLerFileHint, FrmLerFileHint);
  Application.Run;
end.
