unit admin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TFrmadmin = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmadmin: TFrmadmin;

implementation
uses Database_u,home_u;
{$R *.dfm}

procedure TFrmadmin.Button1Click(Sender: TObject);
begin
if MessageDlg('Your sure about this?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   DataM.tblstats.Delete;  // deleting records
 end;
end;

procedure TFrmadmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmhome.Close;
end;

end.
