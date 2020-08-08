unit uFrmLerFileHint.Service;

interface

uses
  System.Classes, uFileHint;

type
  TFrmLerFileHintService = class
  private
  strict private
  public
    class function New: TFrmLerFileHintService;
    function LoadFileToStrigList(const csPathFile:string):TFileHint;
  end;

implementation

uses
  System.SysUtils;

{ TFrmLerFileHintService }

function TFrmLerFileHintService.LoadFileToStrigList(
  const csPathFile: string): TFileHint;
begin
  Result := TFileHint.Create( TStringList.Create );
  if FileExists(csPathFile) then
    Result.Arquivo.LoadFromFile(csPathFile);
end;

class function TFrmLerFileHintService.New: TFrmLerFileHintService;
begin
  Result := Create;
end;

end.
