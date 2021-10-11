object Form1: TForm1
  Left = 223
  Top = 127
  Width = 1101
  Height = 680
  Caption = 'Transfer pdf to text'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1093
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 102
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object LectureDocument: TToolButton
      Left = 0
      Top = 2
      Caption = 'Open *.pdf'
      ImageIndex = 1
      OnClick = LectureDocumentClick
      OnMouseDown = LectureDocumentMouseDown
    end
    object ToolButton4: TToolButton
      Left = 102
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object Copie_vers_text: TToolButton
      Left = 110
      Top = 2
      Caption = 'Cop. -> Text'
      ImageIndex = 3
      OnClick = Copie_vers_textClick
    end
    object ToolButton5: TToolButton
      Left = 212
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 220
      Top = 2
      Caption = 'Cop. -> RichEdit'
      ImageIndex = 3
      OnClick = ToolButton7Click
    end
    object ToolButton9: TToolButton
      Left = 322
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 330
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object CheckBox1: TCheckBox
      Left = 338
      Top = 2
      Width = 38
      Height = 24
      Hint = 'Read document'
      Caption = 'Read'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ToolButton12: TToolButton
      Left = 376
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 384
      Top = 2
      Caption = 'Select *.pdf'
      ImageIndex = 8
      OnClick = ToolButton8Click
    end
    object Edit1: TEdit
      Left = 486
      Top = 2
      Width = 521
      Height = 24
      TabOrder = 0
      Text = '*.pdf'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 633
    Width = 1093
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 300
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 1093
    Height = 604
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'PDF'
      object AcroPDF1: TAcroPDF
        Left = 0
        Top = 0
        Width = 1085
        Height = 573
        Align = alClient
        TabOrder = 0
        ControlData = {000A0000B6590000612F0000}
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Text'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 1085
        Height = 573
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'RichEdit'
      ImageIndex = 2
      object RichEdit1: TRichEdit
        Left = 0
        Top = 0
        Width = 1085
        Height = 573
        Align = alClient
        Lines.Strings = (
          'RichEdit1')
        TabOrder = 0
      end
    end
  end
end
