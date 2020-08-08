unit uFrmLerFileHint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  uFrmLerFileHint.Service, Vcl.ExtCtrls;

type
  TFrmLerFileHint = class(TForm)
    BtnCarregarArquivo: TBitBtn;
    mmArquivo: TMemo;
    mmDetalhes: TMemo;
    opnFile: TOpenTextFileDialog;
    Splitter1: TSplitter;
    procedure BtnCarregarArquivoClick(Sender: TObject);
  private
    { Private declarations }
    FSrv: TFrmLerFileHintService;
    function GetSrv: TFrmLerFileHintService;
    property Srv: TFrmLerFileHintService read GetSrv;
  public
    { Public declarations }
  end;

var
  FrmLerFileHint: TFrmLerFileHint;

implementation

uses
  uFileHint, u.Oo.Hint, System.Generics.Collections;

{$R *.dfm}
{ TFrmLerFileHint }

procedure TFrmLerFileHint.BtnCarregarArquivoClick(Sender: TObject);
var
  _FileHint: TFileHint;
  _Hint: TOoHint;
  _Arquivos: TDictionary<string, TObjectList<TOoHint>>;
  _Pair: TPair<string, TObjectList<TOoHint>>;
begin

  _FileHint := nil;

  if opnFile.Execute then
    _FileHint := Srv.LoadFileToStrigList(opnFile.FileName);

  if _FileHint = nil then
    Exit;

  _Arquivos := TObjectDictionary < string, TObjectList < TOoHint >>.Create;

  mmArquivo.Lines := _FileHint.Arquivo;
  // ShowMessage(mmArquivo.Lines.Count.ToString);
  mmDetalhes.Lines.Clear;
  for _Hint in _FileHint.ToHintLines do
    if not(_Hint.ArquivoComHint.Trim.IsEmpty) then
    begin
      if not _Arquivos.ContainsKey(_Hint.ArquivoComHint.Trim.ToUpper) then
        _Arquivos.Add(_Hint.ArquivoComHint.Trim.ToUpper,
          TObjectList<TOoHint>.Create());

      _Arquivos[_Hint.ArquivoComHint.Trim.ToUpper].Add(_Hint);
    end;

  for _Pair in _Arquivos do
  begin
    mmDetalhes.Lines.Add('======================================================');
    mmDetalhes.Lines.Add(_Pair.Key);
    mmDetalhes.Lines.Add('------------------------------------------------------');
    for _Hint in _Pair.Value do
      mmDetalhes.Lines.Add(_Hint.Mensagem);
  end;





  // if mmDetalhes.Lines.IndexOf(_Hint.ArquivoComHint.Trim) = -1 then
  // mmDetalhes.Lines.Add(_Hint.ArquivoComHint.Trim);

end;

function TFrmLerFileHint.GetSrv: TFrmLerFileHintService;
begin
  if FSrv = nil then
    FSrv := TFrmLerFileHintService.New;
  Result := FSrv
end;

end.
