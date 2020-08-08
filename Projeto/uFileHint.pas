unit uFileHint;

interface

uses
  System.Classes, u.Oo.Hint, System.Generics.Collections;

type

  TFileHint = class
  private
    FArquivo: TStrings;
  public
    constructor Create(const ctArquivo: TStrings);
    class function New(const ctArquivo: TStrings):TFileHint;
    function ToHintLines: TObjectList<TOoHint>;
    property Arquivo: TStrings read FArquivo write FArquivo;
  end;

implementation

{ TFileHint }

constructor TFileHint.Create(const ctArquivo: TStrings);
begin
  FArquivo := ctArquivo
end;

class function TFileHint.New(const ctArquivo: TStrings): TFileHint;
begin
  Result := Create(ctArquivo);
end;

function TFileHint.ToHintLines: TObjectList<TOoHint>;
var
  _Linha: string;
begin
  Result := TObjectList<TOoHint>.Create();
  for _Linha in Arquivo do
    Result.Add(TOoHint.Create(_Linha));
end;

end.
