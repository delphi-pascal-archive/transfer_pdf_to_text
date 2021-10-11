program Pdf_vers_Text_;

uses
  Forms,
  Pdf_vers_Text_u in 'Pdf_vers_Text_u.pas' {Form1};
 
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
