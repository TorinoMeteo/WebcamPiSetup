unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, woeid;

type

  { TForm1 }

    TForm1 = class(TForm)
    E_TIMER: TEdit;
    E_WIDTH: TEdit;
    E_HEIGHT: TEdit;
    Image1: TImage;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    OpenCloseButton: TButton;
    Button2: TButton;
    E_FILETOUPLOAD: TEdit;
    E_DESCRIPTION: TEdit;
    E_HOSTNAME: TEdit;
    E_DIRECTORY: TEdit;
    E_USERNAME: TEdit;
    E_PASSWORD: TEdit;
    E_LOCATION: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    OpenFile: TOpenDialog;
    procedure OpenCloseButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function ExtractText(const Str: string; Delim1, Delim2: char): string;
    procedure Label4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.OpenCloseButtonClick(Sender: TObject);
var
  myFile : TextFile;
  FILETOUPLAD,DESCRIPTION,HOSTANAME,DIRECTORY,USERNAME,PASSWORD,LOCATION,IMG_TIMER,IMG_WIDTH,IMG_HEIGHT,BUFFER: string;


begin
  if OpenCloseButton.Caption = 'Open' then
    begin
  OpenFile.Execute;
  AssignFile(myFile, OpenFile.FileName);
  Reset(myFile);
  ReadLn(myFile, FILETOUPLAD);
  ReadLn(myFile, DESCRIPTION);
  ReadLn(myFile, HOSTANAME);
  ReadLn(myFile, DIRECTORY);
  ReadLn(myFile, USERNAME);
  ReadLn(myFile, PASSWORD);
  ReadLn(myFile, LOCATION);
  ReadLn(myFile, IMG_TIMER);
  ReadLn(myFile, IMG_WIDTH);
  ReadLn(myFile, IMG_HEIGHT);
  CloseFile(myFile);

  E_FILETOUPLOAD.Text:= ExtractText(FILETOUPLAD,'"','"');
  E_DESCRIPTION.Text:= ExtractText(DESCRIPTION,'"','"');
  E_HOSTNAME.Text:= ExtractText(HOSTANAME,'"','"');
  E_DIRECTORY.Text:= ExtractText(DIRECTORY,'"','"');
  E_USERNAME.Text:= ExtractText(USERNAME,'"','"');
  E_PASSWORD.Text:= ExtractText(PASSWORD,'"','"');
  E_LOCATION.Text:= ExtractText(LOCATION,'"','"');
  E_TIMER.Text:= ExtractText(IMG_TIMER,'"','"');
  E_WIDTH.Text:= ExtractText(IMG_WIDTH,'"','"');
  E_HEIGHT.Text:= ExtractText(IMG_HEIGHT,'"','"');
  OpenCloseButton.caption := 'Save';
  Exit;
      end;
   if OpenCloseButton.Caption = 'Save' then
    begin
       OpenCloseButton.Caption := 'Open' ;
         AssignFile(myFile, OpenFile.FileName);
         Rewrite(myFile);
         BUFFER:=UTF8Encode(Concat('FILETOUPLOAD="', E_FILETOUPLOAD.Text,'"'));
         E_FILETOUPLOAD.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('DESCRIPTION="', E_DESCRIPTION.Text,'"'));
         E_DESCRIPTION.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('HOSTNAME="', E_HOSTNAME.Text,'"'));
         E_HOSTNAME.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('DIRECTORY="', E_DIRECTORY.Text,'"'));
         E_DIRECTORY.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('USERNAME="', E_USERNAME.Text,'"'));
         E_USERNAME.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('PASSWORD="', E_PASSWORD.Text,'"'));
         E_PASSWORD.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('LOCATION="', E_LOCATION.Text,'"'));
         E_LOCATION.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('TIMER="', E_TIMER.Text,'"'));
         E_TIMER.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('WIDTH="', E_WIDTH.Text,'"'));
         E_WIDTH.Text:='';
         WriteLn(myFile, BUFFER);
         BUFFER:=UTF8Encode(Concat('HEIGHT="', E_HEIGHT.Text,'"'));
         E_HEIGHT.Text:='';
         WriteLn(myFile, BUFFER);
         CloseFile(myFile);
       Exit;
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form2.ShowModal;
end;


function TForm1.ExtractText(const Str: string; Delim1, Delim2: char): string;
var
  pos1, pos2: integer;
begin
  result := '';
  pos1 := Pos(Delim1, Str);
  pos2 := LastDelimiter(Delim2, Str);
  if (pos1 > 0) and (pos2 > pos1) then
    Result := Copy(Str, pos1 + 1, pos2 - pos1 - 1);
end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;

end.

