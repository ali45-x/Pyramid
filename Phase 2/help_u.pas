unit help_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmHelp = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;
  sUsername:string;


implementation
uses Main_u,home_u;
{$R *.dfm}

procedure TfrmHelp.Panel1Click(Sender: TObject);
begin
if Prevform=2 then frmmain.Show;
if Prevform=1 then frmhome.show;
hide;
end;

end.
