unit u.Oo.Hint;

interface

uses
  System.SysUtils;

type

  TOoHint = class
  private
  strict private
    FMensagem: string;
    FSplit: TArray<String>;
    FArquivoComHint: string;
  public
    constructor Create(const csMensagem: string);

    property Mensagem: string read FMensagem write FMensagem;
    property ArquivoComHint: string read FArquivoComHint;
  end;

implementation

{ TOoHint }

constructor TOoHint.Create(const csMensagem: string);
begin
  FMensagem := csMensagem;
  FArquivoComHint := '';
  if Mensagem.Contains('[') then
  begin
    FSplit := FMensagem.Trim.Split([' '], '[', ']');
    if Length(FSplit) > 1 then
    begin
      FArquivoComHint := FSplit[1];
      if FArquivoComHint.IndexOf('(') > 0 then
        FArquivoComHint := FArquivoComHint.Remove(FArquivoComHint.IndexOf('('));
    end;
  end;

end;

end.
