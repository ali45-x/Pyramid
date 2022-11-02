program Pyramid;

uses
  Forms,
  home_u in 'home_u.pas' {Form1},
  main_u in 'main_u.pas' {Form2},
  help_u in 'help_u.pas' {frmHelp},
  stats_u in 'stats_u.pas' {frmstats},
  Database_u in 'Database_u.pas' {DataM: TDataModule},
  admin_u in 'admin_u.pas' {Frmadmin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmhome, frmhome);
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.CreateForm(Tfrmstats, frmstats);
  Application.CreateForm(TDataM, DataM);
  Application.CreateForm(TFrmadmin, Frmadmin);
  Application.Run;
end.
