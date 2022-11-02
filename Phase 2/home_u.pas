unit home_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, pngimage, jpeg, ExtDlgs,
  Comobj;

type
  Tfrmhome = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    pnllog: TPanel;
    edtusername: TEdit;
    edtpassword: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnlreg: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtrusername: TEdit;
    edtrpassword: TEdit;
    edtrpassword2: TEdit;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmhome: Tfrmhome;
  voice: OleVariant;
  Prevform:integer;
implementation

uses admin_u,main_u, help_u, Database_u,stats_u;
{$R *.dfm}

procedure Tfrmhome.Button1Click(Sender: TObject);
begin

  if pnllog.Visible = true then
  begin
    if DataM.tblUser.Locate('sUsername', LowerCase(edtusername.Text), []) then
    begin
     if DataM.tblUser['sPassword']=edtpassword.Text then
      begin
         frmmain.Show;                // user can proceeeeed
         hide;
         ShowMessage('Welcome back ');
         sUsername:= edtusername.Text;
      end else
      begin                  // error catching
         voice.speak('Your flipin password is wrong, harambes'); // haha
      end;
    end
    else
    begin   // error catching
         voice.speak('Your dumb flip username does not exist,, click on the label above the button to register ,,else enter a valid one,, ha ha');
    end;

  end
  else
  begin
    if DataM.tblUser.Locate('sUsername', LowerCase(edtrusername.Text), []) then
    // error ha
    begin // no duplicate on primary key
      ShowMessage(
        'Usernames are unique, and yours is taken so enter a different one.');
    end
    else
    begin
      if (edtrusername.Text <> '') and (edtrpassword.Text <> '') and
        (edtrpassword2.Text <> '') then                    // user entered all information
      begin
        if edtrpassword.Text = edtrpassword2.Text then // two passwords match
        begin
          with DataM do
          begin
            tblUser.Insert;
            tblUser['sUsername'] := edtrusername.Text; // register
            tblUser['sPassword'] := edtrpassword.Text;
            tblUser.Post; // insert into the databases
            frmHelp.Show;
             if FileExists('help1.txt') then
               begin
                frmHelp.Memo1.Lines.LoadFromFile('help1.txt'); // textfile reading
               end else begin
                 ShowMessage('Your help has been deleted');
               end;
            Prevform:= 2;
            sUsername:= edtrusername.Text;
          end;
        end
        else
        Begin
          ShowMessage('Paswords do not match'); // validation     error catching
        end;
      end
      else
      begin
        ShowMessage('Enter all infomation'); // User did not enter in all edits
      end;
    end;
  end;

end;

procedure Tfrmhome.CheckBox1Click(Sender: TObject);
begin
  if (LowerCase(edtusername.Text) = 'admin') and (CheckBox1.Checked = true) then
  begin
   DataM.tblUser.Locate('sUsername','admin',[]);
   if edtpassword.Text=DataM.tblUser['sPassword'] then
    begin
     Frmadmin.Show;
     Hide;                          // admin only is special
    end;
  end
  else if (LowerCase(edtusername.Text) <> 'admin') and (CheckBox1.Checked = true) then
  begin
    voice.speak('No you not');
  end;
end;

procedure Tfrmhome.FormCreate(Sender: TObject);
begin
voice:= CreateOleObject('SAPI.SpVoice');             // open narrator
end;

procedure Tfrmhome.Label1Click(Sender: TObject);
begin
 frmHelp.Show;
 hide;
 if FileExists('help2.txt') then           // checking..
   begin
    frmHelp.Memo1.Lines.LoadFromFile('help2.txt'); // textfile reading
   end else begin
     ShowMessage('Your help has been deleted');
   end;
 Prevform:= 1;
end;

procedure Tfrmhome.Label3Click(Sender: TObject);
begin
  pnllog.hide;
  pnlreg.Show;
end;

procedure Tfrmhome.Label6Click(Sender: TObject);
begin
  pnllog.Show;
  pnlreg.hide;

end;

end.
