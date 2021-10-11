unit Pdf_vers_Text_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, OleCtrls, AcroPDFLib_TLB, StdCtrls;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    LectureDocument: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Copie_vers_text: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    AcroPDF1: TAcroPDF;
    Edit1: TEdit;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    Memo1: TMemo;
    ToolButton8: TToolButton;
    TabSheet3: TTabSheet;
    RichEdit1: TRichEdit;
    CheckBox1: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure LectureDocumentClick(Sender: TObject);
    procedure Copie_vers_textClick(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure LectureDocumentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton7Click(Sender: TObject);

  Procedure SimuClavierCtrl_(var C : Char);
  procedure Souris_ClickGauche( );
  Procedure SimuClavierCtrl_s(Const s : String);


  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  on_ : wordbool = true;
  Handle1 : integer ;
  
implementation
 
{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
//
     PageControl1.TabIndex := 0;
     memo1.Clear;  RichEdit1.clear;

  IF ParamCount < 1 then
    edit1.Text := ExtractFilePath(  application.ExeName  )+'*.pdf';

// selection des fichier pdf  à l'activation
  IF ParamCount >0 THEN
   caption :='NB DE PARAMETRES / '+ paramstr(1)+' - '+inttostr(ParamCount);
  if trim(paramstr(1)) <>'' then
  begin
   if pos('.pdf', paramstr(1)) > 0 then
      edit1.Text :=  paramstr(1)  ;
  end  ;
    
end;

procedure TForm1.LectureDocumentClick(Sender: TObject);
Var  App,PDDoc,AVDoc,AVPageView:variant;
begin

  if not FileExists(edit1.Text) then EXIT ;
     
      PageControl1.TabIndex := 0;
      sleep(100);
      statusbar1.Panels[1].Text := 'nl : '  ;

     if  Form1.Tag = 0 then
     begin
       Richedit1.Clear; Memo1.Clear;
     end;

  TRY
     AcroPDF1.LoadFile(edit1.Text) ;
     AcroPDF1.SetFocus;
     AcroPDF1.setShowToolbar(on_);

     AcroPDF1.gotoFirstPage;

  Except
       showmessage('erreur lecture pdf'#10 + edit1.Text ); exit;
  end;

end;

procedure TForm1.Copie_vers_textClick(Sender: TObject);
Var C : char ;
begin
//
// copie text dans memo et richedit
//
 MEMO1.Clear;
 MEMO1.Text :=' '; MEMO1.SelectAll ;
 MEMO1.CopyToClipboard;
 Memo1.Clear;Richedit1.Clear;

 PageControl1.TabIndex := 0 ; 

  AcroPDF1.SetFocus;
      sleep(200);
  Application.ProcessMessages;

     sleep(200);
  C := 'A';
    SimuClavierCtrl_(C );
    sleep(200);
  C := 'C';
    SimuClavierCtrl_(C );
     sleep(200);
   application.ProcessMessages;
  //
      sleep(500);


    MEMO1.PasteFromClipboard;
    Richedit1.PasteFromClipboard;
     sleep(200);
    PageControl1.TabIndex := 1;

    Statusbar1.Panels[0].Text :='nlm : ' + inttostr(memo1.Lines.Count);
    Statusbar1.Panels[1].Text :='nlr : ' + inttostr(Richedit1.Lines.Count);

end;   

procedure TForm1.ToolButton8Click(Sender: TObject);
var  Dialog1 : TOpenDialog;
begin

   Dialog1 := TOpenDialog.Create(self);
  
   Dialog1.Filter := 'pdf |*.pdf';
  if  Dialog1.Execute then
  BEGIN
    edit1.Text := Dialog1.FileName  ;
    memo1.Clear; Richedit1.Clear;
    memo1.Text :=' ';  memo1.CopyToClipboard;
    if CheckBox1.Checked then
        LectureDocumentClick(Self);
  end;

   Dialog1.Free
end;

procedure TForm1.LectureDocumentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

   if x >  (LectureDocument.Width div 2)  then LectureDocument.Tag := 1
    else LectureDocument.Tag :=-1;

    statusbar1.Panels[0].Text := inttostr(x)+ ' '+ inttostr(LectureDocument.Tag) ;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
Var C : char ;
begin

memo1.Clear;memo1.Text := ' ';;memo1.SelectAll ;
memo1.CopyToClipboard;
Richedit1.Clear;Richedit1.SelectAll ;
Memo1.Clear;

  PageControl1.TabIndex := 0;  Application.ProcessMessages;
   sleep(200);
  AcroPDF1.SetFocus;
   sleep(200);

 sleep(100);


  C := 'A';
    SimuClavierCtrl_(C );
    sleep(200);
  C := 'C';
    SimuClavierCtrl_(C );
     sleep(200);
  application.ProcessMessages;
  //
      sleep(500);

    Richedit1.PasteFromClipboard;
    Memo1.PasteFromClipboard;
     sleep(200);

    PageControl1.TabIndex := 2;
    Statusbar1.Panels[0].Text :='nlm : ' + inttostr(memo1.Lines.Count);
    Statusbar1.Panels[1].Text :='nlr : ' + inttostr(Richedit1.Lines.Count);
end;
    //------------------------


procedure TForm1.Souris_ClickGauche( );
begin
// click souris gauche
   mouse_event(MOUSEEVENTF_LEFTDOWN,0,0,0,0) ; //
         SLEEP(50);
   mouse_event(MOUSEEVENTF_LEFTUP,0,0,0,0) ;
        SLEEP(50);// MOUSEEVENTF_WHEEL
END;

Procedure TForm1.SimuClavierCtrl_s(Const s : String);
var c_ : Char;
begin
   c_ := Char(s[1]) ;
   SimuClavierCtrl_(C_);
end;
Procedure TForm1.SimuClavierCtrl_(var C : Char);
begin
// SIMULATION CALVIER Ctr A  ...    KEYEVENTF_KEYDOWN
keybd_event(VK_LCONTROL,0,0,0); //j'appuie sur la touche CONTROL GAUCHE
sleep(50);
//
// baisse et relève la touche
//
keybd_event(Ord(C),0,0,0); //j'appuie sur la touche  "C"
sleep(50);
keybd_event(Ord(C),0,KEYEVENTF_KEYUP,0); //relever touche la touche  "C"
sleep(50);

keybd_event(VK_LCONTROL,0,KEYEVENTF_KEYUP,0); //relever  la touche  A
sleep(50);
application.ProcessMessages;
//
end;


end.
