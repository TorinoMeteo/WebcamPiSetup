unit woeid;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, lclintf;

type

  { TForm2 }

  TForm2 = class(TForm)
    GO: TButton;
    E_city: TEdit;
    E_CAP: TEdit;
    E_State: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GOClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.GOClick(Sender: TObject);
var url: string;
begin
          url:=Concat('http://woeid.rosselliot.co.nz/lookup/', E_city.Text,' ', E_CAP.Text,' ' ,E_State.Text);
     OpenURL(url);
end;

end.

