unit stats_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Math;

type
  Tfrmstats = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LblUser: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    lbltimes: TLabel;
    lblHs: TLabel;
    lblAs: TLabel;
    lblTs: TLabel;
    lblbs: TLabel;
    procedure Panel4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmstats: Tfrmstats;
  totalscore: Integer;

implementation
uses main_u,Database_u,help_u;
{$R *.dfm}

procedure Tfrmstats.FormShow(Sender: TObject);
begin
if DataM.tblstats.RecordCount<>0 then
begin
 totalscore:= 0;
 DataM.tblUser.Filtered:= true;                       // only shows user's info
 DataM.tblstats.Filter:= 'sUsername='+QuotedStr(sUsername);
 DataM.tblstats.Sort:= 'Score DESC';         // to obtain high score
 DataM.tblstats.First;
 if DataM.tblUser['sUsername']<>DataM.tblstats['sUsername'] then
  begin
  lblbs.Caption:= 'The score to beat is '+ IntToStr(DataM.tblstats['Score'])+ ' by '+ DataM.tblstats['sUsername'];
  end else
   begin
     lblbs.Caption:= 'You the Boss ,you have the top score '
   end;
 DataM.tblUser.Filter:= 'sUsername='+QuotedStr(sUsername);
 DataM.tblstats.Filtered:= true;
 DataM.tblstats.First;
 while NOT DataM.tblstats.Eof do
 begin
    totalscore:= totalscore+DataM.tblstats['Score'];
    DataM.tblstats.next;                                       // gets total score summing maximum
 end;
 lblTs.Caption:= IntToStr(totalscore);
 LblUser.Caption:= sUsername;
 lblAs.Caption:= IntToStr(Floor(totalscore/DataM.tblstats.RecordCount));// average
 DataM.tblstats.First;
 lblHs.Caption:= IntToStr(DataM.tblstats['Score']);
 lbltimes.Caption:= DataM.tblUser['TimesPlayed'];// times played
end else
begin
  hide;
  frmmain.Show;
  ShowMessage('You have not played any game for stats');        // no stats validates
end;
end;

procedure Tfrmstats.Panel4Click(Sender: TObject);
begin
frmmain.Show;
Hide;
end;

end.
