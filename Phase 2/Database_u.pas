unit Database_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataM = class(TDataModule)
    DsScore: TDataSource;
    ADOConnection1: TADOConnection;
    tblUser: TADOTable;
    tblstats: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataM: TDataM;

implementation

{$R *.dfm}

end.
