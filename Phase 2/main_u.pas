unit main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, math, Buttons, StdCtrls;

type
  Tfrmmain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnmenu: TSpeedButton;
    pnlbtn: TPanel;
    lblscore: TLabel;
    pnlhold: TPanel;
    Button1: TButton;
    Button2: TButton;
    lblleft: TLabel;
    Timer1: TTimer;
    btnhelp: TSpeedButton;
    btnRestart: TSpeedButton;
    btnstats: TSpeedButton;
    Panel3: TPanel;
    pnlm: TPanel;
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    Button3: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnmenuClick(Sender: TObject);
    procedure btnhelpClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure btnstatsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure MakeCards;
    procedure shuffle;
    function imagename(v: integer): string;
    function istaken(inow: integer): Boolean;
    procedure playmove(Sender: TObject);
    procedure Taken(i: integer);
    procedure makeenabled(i: integer; ival: integer);
    function gameover: integer;
  end;

var
  frmmain: Tfrmmain;
  arrShuffled: array [1 .. 52] of integer;
  ArrVal: array [1 .. 52] of integer;
  arrpnl: array [1 .. 52] of TPanel;
  arrimg: array [1 .. 52] of TImage;
  arrTaken: array [1 .. 28] of integer;
  arrTNT, arrPNP: array [1 .. 2] of integer;
  i, c, ileft, itop, ibtn, iplay, iscore, inow, itaken: integer;
  bcheck, bpnlonly, bshowm: Boolean;

implementation

uses help_u, stats_u, database_u, home_u;
{$R *.dfm}

procedure Tfrmmain.btnmenuClick(Sender: TObject);
begin
  Inc(ibtn);
  if ibtn mod 2 = 0 then
  begin
    repeat
      pnlbtn.Left := pnlbtn.Left - 1;
    until (pnlbtn.Left = -350);
  end
  else
  begin
    repeat
      pnlbtn.Left := pnlbtn.Left + 1;
    until (pnlbtn.Left = 0);
  end;
end;

procedure Tfrmmain.Button1Click(Sender: TObject);
begin
  if inow <> 29 then
    Taken(2);
end;

procedure Tfrmmain.Button2Click(Sender: TObject);
begin
  if inow <> 52 then
    Taken(1);
end;

procedure Tfrmmain.Button3Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then
    bshowm := false;
  pnlm.Top := -400;
end;

procedure Tfrmmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmhome.Close;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  MakeCards;
  bshowm := true; // for help
  ibtn := 0;
end;

function Tfrmmain.gameover: integer;
var
  bover: Boolean;
begin
  Result := 1;
  for i := 1 to 28 do
  begin
    for c := 29 to 52 do
    begin
      if (arrpnl[c].Visible = true) and (arrimg[i].Enabled = true) and
        (arrpnl[i].Visible = true) then
      begin
        if (ArrVal[c] = 13) or (ArrVal[i] = 13) then
        begin
          Result := 0;
        end;
        if (ArrVal[c] + ArrVal[i] = 13) then
        begin
          Result := 0;
        end;
      end;
    end;
  end;
  for i := 1 to 28 do
  begin
    for c := 1 to 28 do
    begin
      if (arrpnl[c].Visible = true) and (arrimg[c].Enabled = true) and
        (arrimg[i].Enabled = true) and (arrpnl[i].Visible = true) then
      begin
        if (ArrVal[c] + ArrVal[i] = 13) then
        begin
          Result := 0;
        end;
      end;
    end;
  end;
  bover := true;
  for i := 1 to 28 do
  begin
    if arrpnl[i].Visible = true then
    begin
      bover := false;
    end;
  end;
  if bover = true then
    Result := 2;
end;

function Tfrmmain.imagename(v: integer): string;
begin
  Result := 'cards\card (' + IntToStr(v) + ').png';
end;

function Tfrmmain.istaken(inow: integer): Boolean;
begin
  bcheck := false;
  if arrpnl[inow].Visible = false then
  begin
    Result := true;
    bcheck := true;
  end;
end;

procedure Tfrmmain.MakeCards;
begin
  if Assigned(arrpnl[28]) then // if images have been created
  begin
    for i := 1 to 52 do
    begin
      arrimg[i].Free; // destructor
      arrpnl[i].Free; // delete priv cards
    end;
  end;
  shuffle; // make new cards
  ileft := 432;
  itaken := 0;
  itop := 64; // default values
  iplay := 0;
  Timer1.Interval := 10;
  for i := 1 to 52 do
  begin
    if i = 2 then // makes pyramid shape
    begin
      ileft := 391;
      itop := itop + 40;
    end;
    if i = 4 then
    begin
      ileft := 345; // row 3
      itop := itop + 40;
    end;
    if i = 7 then
    begin
      ileft := 312; // 4'th row and so on till 7
      itop := itop + 40;
    end;
    if i = 11 then
    begin
      ileft := 266;
      itop := itop + 40;
    end;
    if i = 16 then
    begin
      ileft := 242;
      itop := itop + 40;
    end;
    if i = 22 then
    begin
      ileft := 202;
      itop := itop + 40;
    end;
    if i = 29 then // these are in pnl hold
    begin
      ileft := 232;
      itop := 8;
    end
    else if i = 30 then
    begin
      ileft := 8;
    end;
    arrpnl[i] := TPanel.Create(Self); // dynamic componets
    with arrpnl[i] do
    begin
      Left := ileft;
      Top := itop;
      if i < 29 then
      begin
        Parent := frmmain;
      end
      else
      begin
        Parent := pnlhold;
      end;
      Height := 113;
      Width := 81; // properties
      BevelOuter := bvNone;
      if i < 29 then
      begin
        BringToFront;
      end
      else
      begin
        SendToBack;
      end;
      Color := clGrayText;
      ParentBackground := true;
    end;
    arrimg[i] := TImage.Create(Self); // dynamic componets
    with arrimg[i] do
    begin
      Left := 4;
      Top := 4;
      Parent := arrpnl[i];
      Height := 105;
      Width := 73;
      Stretch := true;
      if i < 22 then
      begin
        Enabled := false;
      end;
      Picture.LoadFromFile(imagename(arrShuffled[i])); // fuction called
      OnClick := playmove;
    end;
    if i < 29 then
      ileft := ileft + 80;
  end;
  iscore := 0;
  inow := 29;
end;

procedure Tfrmmain.makeenabled(i, ival: integer);
begin
  if ival = 1 then
  begin
    if (arrpnl[i].Visible = false) and (arrpnl[i + 1].Visible = false) then
    // checks if cards are not blocked
    begin // ival for math checking
      arrimg[i - 6].Enabled := true;
    end;
  end
  else if ival = 2 then
  begin
    if (arrpnl[i].Visible = false) and ((arrpnl[i + 1].Visible = false)) then
    // checks if cards are not blocked
    begin // ival for math checking
      arrimg[i - 5].Enabled := true;
    end;
  end
  else if ival = 3 then
  begin
    if (arrpnl[i].Visible = false) and ((arrpnl[i + 1].Visible = false)) then
    // checks if cards are not blocked
    begin // ival for math checking
      arrimg[i - 4].Enabled := true;
    end;
  end
  else if ival = 4 then
  begin
    if (arrpnl[i].Visible = false) and ((arrpnl[i + 1].Visible = false)) then
    // checks if cards are not blocked
    begin // ival for math checking
      arrimg[i - 3].Enabled := true;
    end;
  end
  else if ival = 5 then
  begin
    if (arrpnl[i].Visible = false) and ((arrpnl[i + 1].Visible = false)) then
    // checks if cards are not blocked
    begin // ival for math checking
      arrimg[i - 2].Enabled := true;
    end;
  end
  else if ival = 6 then
  begin
    if (arrpnl[i].Visible = false) and ((arrpnl[i + 1].Visible = false)) then
    // checks if cards are not blocked
    begin // ival for math checking
      arrimg[i - 1].Enabled := true;
    end;
  end;
end;

procedure Tfrmmain.playmove(Sender: TObject);
begin
  for i := 1 to 52 do
  begin
    if Sender = arrimg[i] then
    begin
      Inc(iplay);
      arrPNP[iplay] := i;

      if iplay = 1 then
      begin
        arrTNT[1] := ArrVal[i];
        arrpnl[i].ParentBackground := false;
        if arrTNT[1] = 13 then
        begin
          arrpnl[i].Visible := false;
          iscore := iscore + 10;
          iplay := 0;
          if i > 28 then
            Inc(itaken);
        end;
      end
      else
      begin
        arrTNT[2] := ArrVal[i];
        if (arrTNT[1] + arrTNT[2]) = 13 then
        begin
          arrpnl[arrPNP[1]].Visible := false;
          arrpnl[arrPNP[2]].Visible := false;
          iscore := iscore + 10;
          if (arrPNP[1] > 28) then
            Inc(itaken);
          if (arrPNP[2] > 28) then
            Inc(itaken);
        end
        else
        begin
          arrpnl[arrPNP[1]].ParentBackground := true;
          arrpnl[arrPNP[2]].ParentBackground := true;
          beep;
          if bshowm=true then
           begin
            repeat                         // the pnl with message is shown if the user wants to see it
             pnlm.Top:= pnlm.Top+1;
            until (pnlm.Top= 48);
            pnlm.BringToFront;
           end;
        end;
        iplay := 0;
      end;
    end;
  end;
end;

procedure Tfrmmain.shuffle;
var
  ishuffle, ival, s, v: integer; // values to shuffle
  isduplicate: Boolean;
begin
  ishuffle := 0;
  for i := 1 to 52 do
  begin
    arrShuffled[i] := 0;
  end;
  while ishuffle <> 52 do
  begin
    isduplicate := false;
    ival := RandomRange(1, 53); // randomizes card order so each game is different
    for i := 1 to 52 do
    begin
      if (ival = arrShuffled[i]) or (ival > 52) then // checking for duplicated
      begin
        isduplicate := true;
      end;
    end;
    if isduplicate = false then
    begin
      Inc(ishuffle); // sets shuffled numbers for cards
      arrShuffled[ishuffle] := ival;
      if (ival > 0) and (ival < 5) then
      begin
        ArrVal[ishuffle] := 1;
      end; // all 1'
      if (ival > 4) and (ival < 9) then
      begin
        ArrVal[ishuffle] := 2;
      end; // all 2'
      if (ival > 8) and (ival < 13) then
      begin
        ArrVal[ishuffle] := 3;
      end; // .. so on till king with value of 13
      if (ival > 12) and (ival < 17) then
      begin
        ArrVal[ishuffle] := 4;
      end;
      if (ival > 16) and (ival < 21) then
      begin
        ArrVal[ishuffle] := 5;
      end;
      if (ival > 20) and (ival < 25) then
      begin
        ArrVal[ishuffle] := 6;
      end;
      if (ival > 24) and (ival < 29) then
      begin
        ArrVal[ishuffle] := 7;
      end;
      if (ival > 28) and (ival < 33) then
      begin
        ArrVal[ishuffle] := 8;
      end;
      if (ival > 32) and (ival < 37) then
      begin
        ArrVal[ishuffle] := 9;
      end;
      if (ival > 36) and (ival < 41) then
      begin
        ArrVal[ishuffle] := 10;
      end;
      if (ival > 40) and (ival < 45) then
      begin
        ArrVal[ishuffle] := 11;
      end; // jacks
      if (ival > 44) and (ival < 49) then
      begin
        ArrVal[ishuffle] := 12;
      end;
      if (ival > 48) and (ival < 53) then
      begin
        ArrVal[ishuffle] := 13;
      end;
    end;
  end;
end;

procedure Tfrmmain.btnhelpClick(Sender: TObject);
begin
  Panel3.Top := btnhelp.Top;
  frmhelp.show;
  if FileExists('help1.txt') then// checking
  begin
   frmHelp.Memo1.Lines.LoadFromFile('help1.txt'); // textfile reading
  end else begin
   ShowMessage('Your help has been deleted');
  end;
  Prevform := 2;
  hide;
end;

procedure Tfrmmain.btnRestartClick(Sender: TObject);
begin
  Panel3.Top := btnRestart.Top;
  if MessageDlg('Are you sure you want to restart', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MakeCards;
  end;
end;

procedure Tfrmmain.btnstatsClick(Sender: TObject);
begin
  Panel3.Top := btnstats.Top;
  frmstats.show;
  hide;
end;

procedure Tfrmmain.Taken(i: integer);
begin
  if i = 1 then
  begin
    Inc(inow);
    istaken(inow);
    while bcheck = true do
    begin
      if inow = 52 then
      begin
        bcheck := false;
      end
      else
      begin
        Inc(inow);
        istaken(inow);
      end;
    end;
    arrpnl[inow].Left := 232;
    arrpnl[inow].BringToFront;
  end
  else
  begin
    dec(inow);
    istaken(inow + 1);
    while bcheck = true do
    begin
      if inow = 29 then
      begin
        bcheck := false;
      end
      else
      begin
        dec(inow);
        istaken(inow + 1);
      end;
    end;
    arrpnl[inow + 1].Left := 8;
    arrpnl[inow + 1].BringToFront;
  end;
end;

procedure Tfrmmain.Timer1Timer(Sender: TObject);
var
  bover: Boolean;
begin
  lblleft.Caption := IntToStr(24 - itaken) + ' cards left';
  lblscore.Caption := 'Score:' + IntToStr(iscore);
  if Assigned(arrpnl[52]) then
  begin
    for i := 22 to 28 do
    begin
      makeenabled(i, 1);
    end;
    for i := 16 to 21 do
    begin
      makeenabled(i, 2);
    end;
    for i := 11 to 15 do
    begin
      makeenabled(i, 3);
    end;
    for i := 7 to 10 do
    begin
      makeenabled(i, 4);
    end;
    for i := 4 to 6 do
    begin
      makeenabled(i, 5);
    end;
    for i := 2 to 3 do
    begin
      makeenabled(i, 6);
    end;
  end;
  if gameover <> 0 then // game is over
  begin
    Timer1.Interval := 10000000000; // slows down timer
    with DataM do
    begin
      tblstats.Insert;
      tblstats['sUsername'] := sUsername;
      tblstats['Score'] := iscore;
      tblstats.Post;
      tblUser.Locate('sUsername', sUsername, []);
      tblUser.Edit;
      tblUser['TimesPlayed'] := tblUser['TimesPlayed'] + 1;
      tblUser.Post;
    end;
    if gameover = 1 then
    begin
      ShowMessage('The game is over, You lost');
      MakeCards;
    end
    else if gameover = 2 then
    begin
      Timer1.Interval := 1000000;
      ShowMessage(
        'You Did it,ya...try listening to (The Storm, by my man Ye and X)');
      // Too TOXIC
    end;
    MakeCards;
  end;

end;

end.
